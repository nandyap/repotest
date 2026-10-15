#!/usr/bin/env pwsh
# Pre-deployment guard, wired into azure.yaml as azd hooks:
#   prepackage   -> preflight.ps1 -Phase package    (before an image is built)
#   preprovision -> preflight.ps1 -Phase provision  (before the template is applied)
#
# It stops a deployment that would otherwise "succeed" and leave the app
# broken or unsafe: an empty secret, the dev identity baked into the web
# page, sign-in on with the dev authenticator still on, a value that is
# obviously wrong. It only READS environment variables (the azd environment
# plus the shell) and never prints a secret.
#
#   -Phase package    only what matters when BUILDING an image (the dev
#                     identity must not be baked into the page). Needs no
#                     secrets, so a code-only `azd deploy` is not blocked.
#   -Phase provision  everything that matters when applying the template:
#                     secrets, auth switches, Entra values, allowlist.
#   -Phase all        both (the default when run by hand).
#
# By hand:  pwsh ./scripts/preflight.ps1
# Inside an azd hook the azd environment is already in the process
# environment; by hand the values are loaded from `azd env get-values`.
# Values already set in the shell win, which is how secrets are supplied.
#
# Escape hatch: set AZURE_SKIP_PREFLIGHT=true to skip it.

param(
    [ValidateSet('all', 'package', 'provision')]
    [string]$Phase = 'all'
)

if ($env:AZURE_SKIP_PREFLIGHT -eq 'true') {
    Write-Warning 'Preflight skipped (AZURE_SKIP_PREFLIGHT=true).'
    exit 0
}

if ([string]::IsNullOrEmpty($env:AZURE_ENV_NAME) -and (Get-Command azd -ErrorAction SilentlyContinue)) {
    foreach ($line in (azd env get-values 2>$null)) {
        if ($line -match '^([A-Za-z0-9_]+)="?(.*?)"?$') {
            if ([string]::IsNullOrEmpty([Environment]::GetEnvironmentVariable($Matches[1]))) {
                [Environment]::SetEnvironmentVariable($Matches[1], $Matches[2])
            }
        }
    }
}

$errors = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]
$guid = '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'
$doProvision = ($Phase -ne 'package')

function Get-Val([string]$Name) {
    $v = [Environment]::GetEnvironmentVariable($Name)
    if ($null -eq $v) { return '' }
    return $v.Trim()
}

function Get-Flag([string]$Name, [bool]$Default) {
    $v = (Get-Val $Name).ToLowerInvariant()
    if ($v -eq '') { return $Default }
    if ($v -eq 'true') { return $true }
    if ($v -eq 'false') { return $false }
    $errors.Add("$Name must be 'true' or 'false' (got '$v').")
    return $Default
}

$stub = Get-Flag 'AZURE_AUTH_STUB_ENABLED' $true     # same defaults as main.bicepparam
$entra = Get-Flag 'AZURE_ENTRA_AUTH_ENABLED' $false
$mode = if ($stub) { 'dev stub' } else { 'Entra sign-in' }

# --- Build-time check (both phases): the page is built once and shipped to
# every visitor, so a fixed dev identity in it defeats real sign-in.
if ((-not $stub) -and ((Get-Val 'NEXT_PUBLIC_DEV_BEARER') -ne '')) {
    $errors.Add('NEXT_PUBLIC_DEV_BEARER is set while real sign-in is selected. It would be built into the web page as a fixed identity for every visitor. Delete the NEXT_PUBLIC_DEV_BEARER line from .azure/<environment>/.env (a plain text file), and make sure it is not set in the shell.')
}

if ($doProvision) {
    # 1. The LLM key. An empty one deploys fine and then every answer fails.
    if ((Get-Val 'AZURE_LLM_API_KEY') -eq '') {
        $errors.Add("AZURE_LLM_API_KEY is empty. Set it in this terminal: `$env:AZURE_LLM_API_KEY = '<key>'.")
    }

    # 1b. Image names. When these are empty the template falls back to a public
    # hello-world image, which would replace the running apps if you ran
    # `azd provision` on its own. (`azd deploy` sets them.)
    foreach ($n in 'SERVICE_BACKEND_IMAGE_NAME', 'SERVICE_FRONTEND_IMAGE_NAME') {
        $img = Get-Val $n
        if ($img -eq '' -or $img -like '*k8se/quickstart*') {
            $warnings.Add("$n is empty or a placeholder. Do NOT run 'azd provision' on its own until it holds a real image (azd env get-value $n); it would replace the running app with a hello-world image. 'azd deploy' fixes it.")
        }
    }

    # 2. The two switches must agree.
    if ($stub -and $entra) {
        $errors.Add('AZURE_ENTRA_AUTH_ENABLED=true but AZURE_AUTH_STUB_ENABLED is not false. The dev authenticator would still accept forged identities.')
    }
    if ((-not $stub) -and (-not $entra)) {
        $errors.Add('AZURE_AUTH_STUB_ENABLED=false but AZURE_ENTRA_AUTH_ENABLED is not true. The backend would demand a token that nobody signs in to get.')
    }

    # 3. Real authentication: the backend must know what to expect.
    if (-not $stub) {
        $tenant = Get-Val 'AZURE_ENTRA_TENANT_ID'
        $aud = Get-Val 'AZURE_ENTRA_EXPECTED_AUDIENCE'
        $iss = Get-Val 'AZURE_ENTRA_EXPECTED_ISSUER'
        $jwks = Get-Val 'AZURE_ENTRA_JWKS_URL'

        foreach ($n in 'AZURE_ENTRA_TENANT_ID', 'AZURE_ENTRA_EXPECTED_AUDIENCE', 'AZURE_ENTRA_EXPECTED_ISSUER', 'AZURE_ENTRA_JWKS_URL') {
            if ((Get-Val $n) -eq '') { $errors.Add("$n is empty (required when the dev stub is off).") }
        }
        if ($tenant -ne '' -and $tenant -notmatch $guid) { $errors.Add('AZURE_ENTRA_TENANT_ID is not a GUID.') }
        if ($tenant -ne '' -and $iss -ne '' -and $iss -notlike "*$tenant*") {
            $errors.Add('AZURE_ENTRA_EXPECTED_ISSUER does not contain the tenant id.')
        }
        if ($tenant -ne '' -and $jwks -ne '' -and $jwks -notlike "*$tenant*") {
            $errors.Add('AZURE_ENTRA_JWKS_URL does not contain the tenant id.')
        }
        if ($iss -ne '' -and $iss -notmatch '^https://') { $errors.Add('AZURE_ENTRA_EXPECTED_ISSUER must start with https://.') }
        if ($jwks -ne '' -and $jwks -notmatch '^https://') { $errors.Add('AZURE_ENTRA_JWKS_URL must start with https://.') }

        # v2 tokens carry the client id as audience; v1 tokens carry the Application ID URI.
        $v2 = $iss -match '/v2\.0$'
        if ($aud -ne '') {
            if ($v2 -and $aud -notmatch $guid) {
                $warnings.Add("Issuer is v2 but the expected audience '$aud' is not a client id (GUID). v2 tokens normally carry the client id. Confirm from a real token.")
            }
            if ((-not $v2) -and $iss -ne '' -and $aud -match $guid) {
                $warnings.Add('Issuer looks like v1 but the expected audience is a GUID. v1 tokens carry the Application ID URI. Confirm from a real token.')
            }
        }
    }

    # 4. Frontend sign-in settings.
    if ($entra) {
        $client = Get-Val 'AZURE_ENTRA_CLIENT_ID'
        $scope = Get-Val 'AZURE_ENTRA_API_SCOPE'
        $allowed = Get-Val 'AZURE_ENTRA_ALLOWED_AUDIENCES'

        if ($client -eq '' -or $client -notmatch $guid) { $errors.Add('AZURE_ENTRA_CLIENT_ID is empty or not a GUID.') }
        if ((Get-Val 'AZURE_ENTRA_TENANT_ID') -notmatch $guid) { $errors.Add('AZURE_ENTRA_TENANT_ID is empty or not a GUID.') }
        if ((Get-Val 'AZURE_ENTRA_CLIENT_SECRET') -eq '') {
            $errors.Add("AZURE_ENTRA_CLIENT_SECRET is empty. Set it in this terminal only: `$env:AZURE_ENTRA_CLIENT_SECRET = '<secret>'.")
        }
        if ($scope -eq '' -or $scope -notmatch '/') { $errors.Add('AZURE_ENTRA_API_SCOPE is empty or has no "/" (expected <Application ID URI>/access_as_user).') }
        if ($allowed -eq '') { $errors.Add('AZURE_ENTRA_ALLOWED_AUDIENCES is empty (expected the Application ID URI).') }
        if ($scope -match '/' -and $allowed -ne '') {
            $resource = $scope.Substring(0, $scope.LastIndexOf('/'))
            $list = $allowed.Split(',') | ForEach-Object { $_.Trim() }
            if ($list -notcontains $resource) {
                $warnings.Add("AZURE_ENTRA_API_SCOPE is for '$resource' but AZURE_ENTRA_ALLOWED_AUDIENCES does not list it. Check the Application ID URI under Expose an API.")
            }
        }
    }

    # 5. Patient-access source and allowlist.
    $authz = (Get-Val 'AZURE_AUTHZ_BACKEND').ToLowerInvariant()
    if ($authz -ne '' -and $authz -ne 'file' -and $authz -ne 'cosmos') {
        $errors.Add("AZURE_AUTHZ_BACKEND must be 'file' or 'cosmos' (got '$authz').")
    }
    $json = Get-Val 'AZURE_AUTHZ_ALLOWLIST_JSON'
    if ($json -ne '') {
        try {
            $doc = $json | ConvertFrom-Json -ErrorAction Stop
            if ($doc.version -ne 1) { $errors.Add('AZURE_AUTHZ_ALLOWLIST_JSON: "version" must be 1.') }
            if ($null -eq $doc.clinicians) { $errors.Add('AZURE_AUTHZ_ALLOWLIST_JSON: missing "clinicians".') }
            elseif ((-not $stub) -and ($doc.clinicians.PSObject.Properties.Name -contains 'demo')) {
                $warnings.Add('AZURE_AUTHZ_ALLOWLIST_JSON still lists the dev user "demo". It is inert with real sign-in but should be removed.')
            }
        }
        catch {
            $errors.Add('AZURE_AUTHZ_ALLOWLIST_JSON is not valid JSON. In Windows PowerShell 5.1, "azd env set" strips the quotes; set it as a shell variable instead: $env:AZURE_AUTHZ_ALLOWLIST_JSON = ''{"version":1,"clinicians":{}}''.')
        }
    }
}

# Report.
Write-Host "== EGP MAF preflight ($Phase; mode: $mode) =="
foreach ($w in $warnings) { Write-Warning $w }
if ($errors.Count -gt 0) {
    foreach ($e in $errors) { Write-Host "ERROR: $e" -ForegroundColor Red }
    Write-Host "Preflight failed with $($errors.Count) error(s). Nothing was deployed. Fix the above, or set AZURE_SKIP_PREFLIGHT=true to bypass." -ForegroundColor Red
    exit 1
}
Write-Host 'Preflight passed.'
exit 0
