Connecting to stream...
2026-10-29T09:06:41.24755  Connecting to the container 'backend'...

2026-10-29T09:06:41.27712  Successfully Connected to container: 'backend' [Revision: 'ca-intake-intake-dev-backend--azd-1793259356', Replica: 'ca-intake-intake-dev-backend--azd-1793259356-85df455dcb-7525j']
2026-10-29T07:54:18.2016286Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: ed283211-688c-4c04-ae84-ffa5b7cd947f with parent checkpoint at iteration 14: c4587c03-bf78-4906-8e12-5270428b283f
2026-10-29T07:54:18.2017118Z stderr F INFO    agent_framework._workflows._runner Starting superstep 15
2026-10-29T07:54:18.2051021Z stderr F INFO    agent_framework._workflows._runner Completed superstep 15
2026-10-29T07:54:18.2100965Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: deb57723-f11f-4032-ab97-6301bff1c4c9 with parent checkpoint at iteration 15: ed283211-688c-4c04-ae84-ffa5b7cd947f
2026-10-29T07:54:18.2101601Z stderr F INFO    agent_framework._workflows._runner Workflow completed after 15 supersteps
2026-10-29T07:54:18.2109787Z stderr F INFO    heatmap.derive               Heatmap: derived 7 cell(s) — 7 consumed
2026-10-29T07:54:18.2585189Z stdout F INFO:     100.100.0.10:0 - "POST /api/runs/M42-INT-SYN001/gates HTTP/1.1" 200 OK
2026-10-29T07:54:18.2727596Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK
2026-10-29T07:54:18.2995455Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK
2026-10-29T07:54:37.2518153Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK
2026-10-29T07:54:37.2537569Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK
2026-10-29T07:57:54.5868319Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK
2026-10-29T07:57:54.5880288Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK
2026-10-29T07:59:17.9502043Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK
2026-10-29T07:59:17.9513549Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK
2026-10-29T07:59:18.0263848Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-SYN001/gates/2f0c47df-6b81-4519-bc49-98227fcf179f/dossier.pdf HTTP/1.1" 200 OK
2026-10-29T07:59:50.3874576Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK
2026-10-29T07:59:50.3921887Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK
2026-10-29T09:03:20.1890934Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK
2026-10-29T09:03:20.7035874Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK

2026-10-29T09:06:47.5950065Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK
2026-10-29T09:06:47.6109851Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-SYN001/timeline HTTP/1.1" 200 OK
2026-10-29T09:06:47.6113761Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK
2026-10-29T09:06:47.6870539Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-SYN001 HTTP/1.1" 200 OK

2026-10-29T09:06:48.8731956Z stdout F INFO:     100.100.0.50:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:06:48.8785789Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:06:51.3856467Z stdout F INFO:     100.100.0.50:0 - "GET /api/samples HTTP/1.1" 200 OK

2026-10-29T09:06:53.8001035Z stdout F INFO:     100.100.0.50:0 - "GET /api/samples/onboarding HTTP/1.1" 200 OK
2026-10-29T09:06:53.8141333Z stderr F INFO    agent_framework._workflows._validation Dead-end executors detected (no outgoing edges): ['terminal']. Verify these are intended as final nodes in the workflow.
2026-10-29T09:06:53.8155241Z stderr F INFO    workflow.graph               Derivation graph built: 19 steps (3-22, less deferred step 12), 5 gates, 5 declared cycles, 14 agent(s) wired (rest run as stubs)
2026-10-29T09:06:53.8163770Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: c6ff5b8d-35fb-4b0c-ae89-45bfe3a18f77 with parent checkpoint at iteration 0: None
2026-10-29T09:06:53.8164740Z stderr F INFO    agent_framework._workflows._runner Starting superstep 1
2026-10-29T09:06:53.8167543Z stderr F INFO    workflow.executors           [M42-INT-73B7E130] step 3 · Frame use case

2026-10-29T09:07:00.0336902Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"
2026-10-29T09:07:00.0354647Z stderr F INFO    agent_framework._workflows._runner Completed superstep 1
2026-10-29T09:07:00.0366242Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 464d77a4-4568-4501-8f82-3a1d1b07a4de with parent checkpoint at iteration 1: c6ff5b8d-35fb-4b0c-ae89-45bfe3a18f77
2026-10-29T09:07:00.0366728Z stderr F INFO    agent_framework._workflows._runner Starting superstep 2
2026-10-29T09:07:00.0372960Z stderr F INFO    agent_framework._workflows._runner Completed superstep 2
2026-10-29T09:07:00.0396906Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 9185e460-42c0-47b2-b636-549be1d2b79d with parent checkpoint at iteration 2: 464d77a4-4568-4501-8f82-3a1d1b07a4de
2026-10-29T09:07:00.0397087Z stderr F INFO    agent_framework._workflows._runner Workflow completed after 2 supersteps

2026-10-29T09:07:00.0618905Z stdout F INFO:     100.100.0.50:0 - "POST /api/submissions HTTP/1.1" 200 OK
2026-10-29T09:07:00.0618971Z stderr F INFO    server                       submission M42-INT-73B7E130 accepted
2026-10-29T09:07:00.1349961Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK
2026-10-29T09:07:00.1414670Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK

2026-10-29T09:07:14.8901481Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK
2026-10-29T09:07:14.8956740Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK

2026-10-29T09:07:22.4715316Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 4f2f8646-f08f-43a1-b2be-d2af15a75a80 with parent checkpoint at iteration 2: 9185e460-42c0-47b2-b636-549be1d2b79d
2026-10-29T09:07:22.4715638Z stderr F INFO    agent_framework._workflows._runner Starting superstep 3
2026-10-29T09:07:22.4719853Z stderr F INFO    agent_framework._workflows._runner Completed superstep 3
2026-10-29T09:07:22.4732329Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 373a291c-f8a9-48f2-9a94-3afb9cbcc2a8 with parent checkpoint at iteration 3: 4f2f8646-f08f-43a1-b2be-d2af15a75a80
2026-10-29T09:07:22.4732595Z stderr F INFO    agent_framework._workflows._runner Starting superstep 4
2026-10-29T09:07:22.4735310Z stderr F INFO    workflow.executors           [M42-INT-73B7E130] step 4 · Decompose elements

2026-10-29T09:07:31.3099487Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"
2026-10-29T09:07:31.3120046Z stderr F INFO    agent_framework._workflows._runner Completed superstep 4
2026-10-29T09:07:31.3128983Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 06449ad2-d001-4be0-91b0-312fc56ddaed with parent checkpoint at iteration 4: 373a291c-f8a9-48f2-9a94-3afb9cbcc2a8
2026-10-29T09:07:31.3129308Z stderr F INFO    agent_framework._workflows._runner Starting superstep 5
2026-10-29T09:07:31.3132930Z stderr F INFO    workflow.executors           [M42-INT-73B7E130] step 5 · Match capabilities

2026-10-29T09:07:38.8701666Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"

2026-10-29T09:07:45.1342958Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"

2026-10-29T09:07:51.9916623Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"

2026-10-29T09:07:59.5602223Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"
2026-10-29T09:07:59.5615001Z stderr F INFO    workflow.runtime             Discarding model-authored provenance on CoverageMap: gap_flags[].raised_at

2026-10-29T09:08:03.3470017Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"
2026-10-29T09:08:03.3487990Z stderr F INFO    workflow.steps               Step 5 aggregated 5 samples: 5 matches, 0 unmatched, 0 unresolved
2026-10-29T09:08:03.3492045Z stderr F INFO    agent_framework._workflows._runner Completed superstep 5
2026-10-29T09:08:03.3505217Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 5f710e1b-593d-4776-a99c-32dc88ccefa2 with parent checkpoint at iteration 5: 06449ad2-d001-4be0-91b0-312fc56ddaed
2026-10-29T09:08:03.3505707Z stderr F INFO    agent_framework._workflows._runner Starting superstep 6
2026-10-29T09:08:03.3509681Z stderr F INFO    workflow.executors           [M42-INT-73B7E130] step 6 · Match realisations

2026-10-29T09:08:11.0406143Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"
2026-10-29T09:08:11.0421662Z stderr F INFO    workflow.runtime             Discarding model-authored provenance on RealisationMatch: gap_flags[].raised_at, gap_flags[].raised_at, gap_flags[].raised_at, gap_flags[].raised_at
2026-10-29T09:08:11.0426760Z stderr F INFO    agent_framework._workflows._runner Completed superstep 6
2026-10-29T09:08:11.0440382Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 42fbf4d6-3f8e-4f6e-b9a5-d5e540d26bee with parent checkpoint at iteration 6: 5f710e1b-593d-4776-a99c-32dc88ccefa2
2026-10-29T09:08:11.0440695Z stderr F INFO    agent_framework._workflows._runner Starting superstep 7
2026-10-29T09:08:11.0446198Z stderr F INFO    workflow.executors           [M42-INT-73B7E130] step 7 · Assign criticality band

2026-10-29T09:08:14.3212239Z stderr F INFO    httpx2                       HTTP Request: POST https://api.core42.ai/v1/responses "HTTP/1.1 200 OK"
2026-10-29T09:08:14.3233346Z stderr F INFO    agent_framework._workflows._runner Completed superstep 7
2026-10-29T09:08:14.3245704Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 58a02832-b582-4504-b6ed-491cbf6f1ba7 with parent checkpoint at iteration 7: 42fbf4d6-3f8e-4f6e-b9a5-d5e540d26bee
2026-10-29T09:08:14.3246359Z stderr F INFO    agent_framework._workflows._runner Starting superstep 8
2026-10-29T09:08:14.3251925Z stderr F INFO    workflow.executors           [M42-INT-73B7E130] step 8 · Feasibility verdict
2026-10-29T09:08:14.3254799Z stderr F INFO    deterministic.feasibility    Feasibility verdict for M42-INT-73B7E130: proceed (6 rules evaluated)
2026-10-29T09:08:14.3256696Z stderr F INFO    deterministic.business_case  Initial business case for M42-INT-73B7E130: defer (annual value=None)
2026-10-29T09:08:14.3260051Z stderr F INFO    agent_framework._workflows._runner Completed superstep 8
2026-10-29T09:08:14.3273021Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 0e024cfa-0d56-47c8-b4a3-b3a581c5cda0 with parent checkpoint at iteration 8: 58a02832-b582-4504-b6ed-491cbf6f1ba7
2026-10-29T09:08:14.3273368Z stderr F INFO    agent_framework._workflows._runner Starting superstep 9
2026-10-29T09:08:14.3288524Z stderr F INFO    agent_framework._workflows._runner Completed superstep 9
2026-10-29T09:08:14.3328661Z stderr F INFO    agent_framework._workflows._runner Created checkpoint: 589610f2-6533-46d6-87f0-482273ad08c9 with parent checkpoint at iteration 9: 0e024cfa-0d56-47c8-b4a3-b3a581c5cda0
2026-10-29T09:08:14.3328976Z stderr F INFO    agent_framework._workflows._runner Workflow completed after 9 supersteps
2026-10-29T09:08:14.3334993Z stderr F INFO    heatmap.derive               Heatmap: derived 3 cell(s) — 3 consumed
2026-10-29T09:08:14.3675777Z stdout F INFO:     100.100.0.19:0 - "POST /api/runs/M42-INT-73B7E130/gates HTTP/1.1" 200 OK
2026-10-29T09:08:14.3817022Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK
2026-10-29T09:08:14.3885849Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK

2026-10-29T09:08:27.2488852Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK
2026-10-29T09:08:27.2533984Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK

2026-10-29T09:08:55.7384113Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK
2026-10-29T09:08:55.7407543Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK

2026-10-29T09:08:58.9138844Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK
2026-10-29T09:08:58.9146803Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK

2026-10-29T09:09:00.2419973Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:00.2438750Z stdout F INFO:     100.100.0.50:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:09:02.8910762Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK
2026-10-29T09:09:02.8920768Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK

2026-10-29T09:09:17.0146273Z stdout F INFO:     100.100.0.50:0 - "GET /api/runs/M42-INT-73B7E130/timeline HTTP/1.1" 200 OK
2026-10-29T09:09:17.0154358Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs/M42-INT-73B7E130 HTTP/1.1" 200 OK

2026-10-29T09:09:18.8984304Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:18.8998151Z stdout F INFO:     100.100.0.50:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:09:23.5390371Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:09:23.5405753Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:09:27.5306521Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:27.5325614Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:09:31.5225314Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:09:31.5246773Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:09:35.5276859Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:35.5294856Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:09:39.5274136Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:39.5347081Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:09:43.5277413Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:43.5361405Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:09:47.5298495Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:47.5515557Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:09:51.5301834Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:09:51.5330911Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:09:55.5315526Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:09:55.5354057Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:09:59.5293738Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:09:59.5320371Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:03.5324131Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:03.5342719Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:07.5290977Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:10:07.5308506Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:10:11.5305162Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:10:11.5323005Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:10:15.5288759Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:10:15.5329250Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:10:19.5280244Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:10:19.5305451Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:10:22.9122553Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:22.9142838Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:26.9014415Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:26.9026878Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:30.9336252Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:30.9349655Z stdout F INFO:     100.100.0.50:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:35.5394422Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:35.5478710Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:39.5295009Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:10:39.5307118Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:10:43.5298024Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:43.5301399Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:47.5200700Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:47.5213020Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:51.5294452Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:10:51.5316281Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:10:55.5299766Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:10:55.5326982Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:10:59.5300452Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:10:59.5324642Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:03.5267498Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:03.5291200Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:07.5301434Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:07.5317008Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:11.5305404Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:11.5317832Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:15.5317630Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:15.5351568Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:19.5320679Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:11:19.5333804Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:11:23.5299601Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:11:23.5317817Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:11:27.5306892Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:27.5346696Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:31.5299320Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:11:31.5308569Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:11:35.5273663Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:11:35.5280483Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:11:39.5274074Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:11:39.5284809Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:11:43.5328851Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:43.5336758Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:47.5297317Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:47.5306965Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:51.5290761Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:51.5311272Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:55.5275288Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:11:55.5301007Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:11:59.5297582Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:11:59.5306202Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:12:03.5297511Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:12:03.5302819Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:12:07.5295752Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:07.5304192Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:11.5287545Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:11.5311118Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:15.5302567Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:15.5313130Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:19.5274282Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:19.5299784Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:23.5299112Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:23.5311716Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:27.5330027Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:27.5340294Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:31.5307560Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:31.5312547Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:35.5295608Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:12:35.5306797Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:12:39.5260863Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:39.5275987Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:43.5211495Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:43.5224049Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:47.5270395Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:47.5290380Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:51.5295367Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:51.5319338Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:55.5297700Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:12:55.5316356Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:12:59.5292757Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:12:59.5296485Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:03.5225209Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:13:03.5233064Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:07.5240837Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:13:07.5248098Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:10.9001014Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:13:10.9004702Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:14.9007796Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:13:14.9031402Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:13:18.8992536Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:13:18.9016569Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:13:22.8996251Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:13:22.9007885Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:26.9018211Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:13:26.9034570Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:30.9018177Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:13:30.9030229Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK

2026-10-29T09:13:34.9024044Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:13:34.9038574Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:38.9005808Z stdout F INFO:     100.100.0.10:0 - "GET /api/runs HTTP/1.1" 200 OK
2026-10-29T09:13:38.9012517Z stdout F INFO:     100.100.0.19:0 - "GET /api/health HTTP/1.1" 200 OK

2026-10-29T09:13:42.8983484Z stdout F INFO:     100.100.0.10:0 - "GET /api/health HTTP/1.1" 200 OK
2026-10-29T09:13:42.8998103Z stdout F INFO:     100.100.0.19:0 - "GET /api/runs HTTP/1.1" 200 OK
