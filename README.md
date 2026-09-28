# repotest
test repo


Updated todo list

Send them this:

`azd deploy` (via ACR Tasks remote build) needs to upload the build source to a Microsoft-managed Azure Storage endpoint, which in this run resolved to `acrtaskproduaen005.blob.core.windows.net` on port 443 — the connection is being reset (`wsarecv: An existing connection was forcibly closed by the remote host`), consistent with an egress firewall/proxy block rather than an Azure-side failure. This hostname is dynamic/regional (not a fixed FQDN we can pin), so it sits under the broader `*.blob.core.windows.net` domain / Azure "Storage" service tag for the `uaenorth` region. Can you check whether outbound HTTPS from this VM to Azure Blob Storage in `uaenorth` is currently blocked, and if so, allow it (by FQDN wildcard or Storage service tag) so the deployment build can complete?
