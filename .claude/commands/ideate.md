# /ideate [YOUR SKILLS/INTERESTS]

Run this command when you have the technical skills but **no exact idea** of what to build. 

Internally, this invokes the **Ideator** agent which will search for unsexy, high-pain B2B problems that fit a solo developer, specifically avoiding saturated markets.

**Usage:**
```bash
/ideate "I know Next.js, Node, and have an interest in local fitness gyms and personal trainers."
# OR
/ideate "Give me 3 boring B2B SaaS ideas that a solo dev can build in 2 weeks."
```

**Instructions to Claude:**
Invoke the Ideator agent (`/agent ideator`) and pass the user's prompt to it. Ensure it outputs exactly 3 detailed ideas following the "Pitch" protocol, including the exact search queries the user should run to gather PDFs for the NotebookLM Phase 1 Research.
