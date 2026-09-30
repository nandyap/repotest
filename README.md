# Cosmos Persistence — Managed Identity Token Failure

Diagnosis handoff. No code or infrastructure changes were made while producing this —
everything below is read-only verification via `az` CLI and `az containerapp exec`.

## Symptom

`/api/health` reports persistence as unreadable:

```json
{
  "persistence": {
    "mode": "cosmos",
    "location": "https://cosdb-m42-ailz-dev-uaen-01.documents.azure.com:443/",
    "identity": "145781a6-e02b-4770-b01d-e2ca5639f9ca",
    "scope": "https://cosmos.azure.com/.default",
    "readable": false,
    "error": "CredentialUnavailableError: App Service managed identity configuration not found in environment. Token request error: (invalid_scope) 500, An unexpected error occured while fetching the AAD Token."
  }
}
```

Persists across redeploys and across a revision restart.

## Environment

- Subscription: `sub-m42-intake-agent` (`02830ed9-d80d-449d-83d7-88b2b4613ba5`)
- Resource group: `rg-m42-ailz-dev-uaen-01` (UAE North)
- Container Apps Environment: `cae-m42-ailz-dev-uaen-01` (Consumption profile)
- Container apps: `ca-intake-intake-dev-backend`, `ca-intake-intake-dev-frontend`
- Cosmos account: `cosdb-m42-ailz-dev-uaen-01`
- Backend identity: `id-intake-intake-dev-backend` (clientId `145781a6-e02b-4770-b01d-e2ca5639f9ca`, principalId `eb621cc0-675b-4f5a-9723-e615e5709af6`)
- Frontend identity: `id-intake-intake-dev-frontend` (clientId `a25d1900-742e-4c01-ae25-db2b645aa9a8`)

## What was ruled out

All verified directly against the live deployment, not assumed:

| Area | Check | Result |
|---|---|---|
| Cosmos RBAC | `az cosmosdb sql role assignment list` | Backend identity's principalId (`eb621cc0-...`) has **Cosmos DB Built-in Data Contributor** (`00000000-...-002`) scoped at the whole account. Correct and sufficient for `design-packs` / `checkpoints`. |
| Identity attachment | `az containerapp show` → `identity.userAssignedIdentities` | Only the backend identity is attached; clientId matches `AZURE_CLIENT_ID` env var exactly. |
| Container env | `printenv` inside the running container | `AZURE_CLIENT_ID`, `COSMOS_ENDPOINT`, `COSMOS_DATABASE=intake`, `IDENTITY_ENDPOINT`, `IDENTITY_HEADER`, `MSI_ENDPOINT`, `MSI_SECRET` all present and correctly valued. |
| SDK versions | `pip show azure-identity azure-cosmos` in the image | `azure-identity 1.25.3`, `azure-cosmos 4.17.1` — current, well above the versions required for `AZURE_COSMOS_AAD_SCOPE_OVERRIDE` support. |
| Deploy freshness | `az containerapp revision list` | Active revision created the same day as this investigation (`azd-deploy-...`), so this is not a stale image. |
| Client-side scope handling | Read `azure/identity/_internal/__init__.py::_scopes_to_resource` from the installed package | Correctly strips the `/.default` suffix before building the token request — rules out a scope-formatting bug in our `AZURE_COSMOS_AAD_SCOPE_OVERRIDE` usage. |
| DNS / network path | `socket.gethostbyname(...)` and raw TCP connect from inside the container, and `Resolve-DnsName` / `Test-NetConnection` from outside Azure | Resolves to a private-endpoint IP (`10.13.84.41`); TCP:443 connects successfully from both inside the container and externally. |
| Cosmos network ACLs | `az cosmosdb show` | `isVirtualNetworkFilterEnabled: false`, `ipRules: []`, `publicNetworkAccess: Enabled` — fully open, no firewall involved. |
| Azure Resource Health | `Microsoft.ResourceHealth/availabilityStatuses` for the subscription | Cosmos, AI Search, Foundry, storage, load balancer all report **Available / no known problems**. (Managed Environments aren't a tracked resource type in this API, so it can't confirm/deny there directly.) |
| Restart | Revision restart, and a brand-new revision from today's redeploy | **Did not resolve it** — same error on a completely fresh replica. |

## Root cause

The `"App Service managed identity configuration not found in environment"` text is
**fixed boilerplate** that `azure-identity`'s `AppServiceCredential.get_unavailable_message()`
always prepends to this credential's errors — it does not mean the environment variables are
actually missing (they are present, see table above). The real cause is the appended text:

> `Token request error: (invalid_scope) 500, An unexpected error occured while fetching the AAD Token.`

This was confirmed by calling the identity broker directly (bypassing the SDK entirely), from
inside both containers:

```
# backend identity (145781a6-...), from inside ca-intake-intake-dev-backend
GET http://localhost:12356/msi/token?api-version=2019-08-01&resource=https://cosmos.azure.com&client_id=145781a6-...
  -> HTTP 500 {"statusCode":500,"message":"An unexpected error occured while fetching the AAD Token.","correlationId":"1b9a1ef8-0f16-435a-9aba-1c0aff5e20dc"}

GET ...&resource=https://management.azure.com&...
  -> HTTP 500 {"statusCode":500,"message":"...","correlationId":"ffa18b39-c83b-482c-896d-c5710ca18d15"}

# frontend identity (a25d1900-...), from inside ca-intake-intake-dev-frontend
GET ...&resource=https://management.azure.com&client_id=a25d1900-...
  -> HTTP 500 (same message)

GET ...&resource=https://vault.azure.net&...
  -> HTTP 500 {"statusCode":500,"message":"...","correlationId":"7e9af3f5-b3e1-4bec-9cd4-faadb36a4d89"}
```

**Every resource audience tested, for both identities, in both container apps, fails
identically.** This is not Cosmos-specific, not RBAC, not app config, not network/DNS. The
Container Apps Environment's own managed-identity broker (`localhost:12356`, the
"App Service"-style MSI extension) cannot issue a token for anything, for anyone, in this
environment. That is a platform-level fault in `cae-m42-ailz-dev-uaen-01`.

## Status / recommended action

1. **Azure support ticket** is the correct path to actually fix this — it's a broker-level
   fault, not something app-side config can remediate. Reference:
   - Resource: `cae-m42-ailz-dev-uaen-01` (rg `rg-m42-ailz-dev-uaen-01`, UAE North)
   - Symptom: MSI extension (`/msi/token`, api-version `2019-08-01`) returns 500
     `"An unexpected error occured while fetching the AAD Token"` for every identity and
     every resource audience in the environment.
   - Correlation IDs: `1b9a1ef8-0f16-435a-9aba-1c0aff5e20dc`,
     `ffa18b39-c83b-482c-896d-c5710ca18d15`, `7e9af3f5-b3e1-4bec-9cd4-faadb36a4d89`
   - Already ruled out: RBAC, identity attachment, SDK version, stale deploy, DNS/network,
     revision restart, fresh revision.

2. **Workaround while the ticket is open** — see below.

## Workaround: Cosmos master-key auth (not yet implemented)

`az cosmosdb show` confirms `disableLocalAuth: false` — key-based (local) auth is permitted
on this account. This is a viable stopgap **specifically because HMAC key-signing happens
entirely client-side in the SDK and never calls the broken `localhost:12356` broker at all**,
so it sidesteps today's failure completely regardless of whether the identity broker gets
fixed.

Trade-offs to weigh before adopting it:

- The master key is **account-wide, full read-write** — broader than the identity's current
  scoped `Cosmos DB Built-in Data Contributor` role assignment. Anyone holding the key has
  full account access, not just `design-packs`/`checkpoints`.
- The read-only secondary key is not sufficient here: this store calls `upsert_item()` and
  `delete_item()`, so it needs a read-write key.
- Should be treated as temporary. The environment-wide identity broker failure is a platform
  bug that still needs fixing/reporting even if a key unblocks the app.

Implementation sketch (requires a code change — deliberately not made yet):

- Retrieve a key: `az cosmosdb keys list --name cosdb-m42-ailz-dev-uaen-01 -g rg-m42-ailz-dev-uaen-01`
  (primary/secondary read-write, or `--type read-only-keys` if a read-only path is ever added).
- Store it as a Key Vault secret (backend identity already holds `Key Vault Secrets User`) and
  wire it into the container app the same way `compassSecretName` is already wired in
  `infra/app.bicep` (a Key Vault-backed container app secret, not a plain env var).
- In `backend/persistence.py::CosmosRunStore._connect()`, add a branch that builds
  `CosmosClient(self._endpoint, credential=<key>)` when a key/secret is configured, instead of
  `ManagedIdentityCredential`/`DefaultAzureCredential`. Keep the existing managed-identity path
  as the default so this reverts cleanly once the platform issue is fixed.




 Enable a system-assigned identity on the backend:

az containerapp identity assign -n ca-intake-intake-dev-backend `
  -g rg-m42-ailz-dev-uaen-01 --system-assigned

Then request a token from inside the container with no client_id at all. Today that returns 400 "Unable to load the proper Managed Identity" — correct, because there isn't one. With a system-assigned identity present:

Still 500 → the broker is broken regardless of identity. Conclusive. Ticket only.
Works → user-assigned identity binding is the fault, and recreating them is the fix.
That's additive, reversible (identity remove), and doesn't touch the working config. It's the one test I'd still run.

