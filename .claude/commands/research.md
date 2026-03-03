# /research [IDEA]

Run this command to autonomously research a new idea and generate the `docs/project-spec.md` file. 

Internally, this invokes the **Researcher** agent which uses MCP tools (like brave-search) to find competitors, analyze pricing, discover pain points on Reddit, and format the final project specification document.

**Usage:**
```bash
/research "A SaaS for dog walkers to manage their schedule and billing"
```

**Instructions to Claude:**
Invoke the Researcher agent (`/agent researcher`) and pass the user's idea to it to start the autonomous research protocol. Ensure it writes the final output to `docs/project-spec.md`.
