# /research [IDEA]

Run this command to autonomously research a new idea and generate the `docs/project-spec.md` file. 

Internally, this invokes the **Researcher** agent which uses MCP tools (like brave-search) to find competitors, analyze pricing, discover pain points on Reddit, and format the final project specification document.

**Usage:**
```bash
/research "A SaaS for dog walkers to manage their schedule and billing"
# OR with a NotebookLM knowledge base:
/research "A SaaS for dog walkers" "https://notebooklm.google.com/notebook/..."
```

**Instructions to Claude:**
Invoke the Researcher agent (`/agent researcher`) and pass the user's idea (and NotebookLM link, if provided) to it to start the autonomous research protocol. If a link is provided, use the NotebookLM skill to extract data instead of web searching. Ensure it first writes a critical analysis to `docs/validation-report.md` and then the final actionable spec to `docs/project-spec.md`.
