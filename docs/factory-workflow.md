# The Indie AI Factory Workflow 🏭

This document outlines the exact end-to-end process of taking a vague interest and turning it into a validated, revenue-generating product using the Indie AI Factory stack.

**The Golden Rule:** Each phase produces a specific artifact that feeds the next. Never skip a phase. Never start coding before the spec is battle-tested.

```
Phase 0: Ideation           → Output: docs/ideation-results.md (3 raw ideas)
    ↓ (You pick ONE idea)
Phase 0.5: Source Scout      → Output: docs/source-shopping-list.md (exact URLs + keywords)
    ↓ (You load sources into NotebookLM)
Phase 1: The Deep Dive       → Output: docs/validation-report.md (GO / NO-GO)
    ↓ (If GO)
Phase 2: The Bible            → Output: docs/project-spec.md (100% complete)
    ↓
Phase 3: Factory Setup        → Clone template, ./setup.sh
    ↓
Phase 4: Architecture         → Output: architecture.md + schema.sql
    ↓
Phase 5: The Night Mission    → Antigravity builds the MVP
    ↓
Phase 6: The Daily Loop       → Iterate & Ship
```

---

## Phase 0: Ideation (The "Unsexy" Approach)

**Goal:** Go from "I don't know what to build" to 3 concrete, validated ideas.

You don't need an idea to start. You just need your **skills** and a vague **interest area**. The Indie AI Factory has two Ideator agents that will autonomously scrape the web for real pain points.

### Option A: Antigravity (Recommended — Zero Claude Tokens)

In your IDE chat (Cursor/VS Code), tell Antigravity:
```text
Run the workflow /ideation. My skills: Next.js, Node.js. Interests: local businesses, landscaping, property management.
```

Antigravity launches its browser subagent, navigates to **search.brave.com**, scrapes Reddit threads and niche forums, cross-references the complaints against your skills, and outputs 3 validated ideas.

### Option B: Claude Code (Terminal)

```bash
claude
> /ideate "My skills: Next.js, Node.js. Interests: local businesses, landscaping."
```

### The Output (Both Options)

The Ideator writes `docs/ideation-results.md` containing:
- **3 highly specific, "boring" B2B SaaS ideas** (no AI wrappers, no two-sided marketplaces)
- For each idea: The pain point, the MVP, and why it works for a solo dev
- **Crucially: The exact Brave/Google search queries** you need to gather research material for Phase 1

```text
Example output search queries:
- site:reddit.com/r/Handwerker "angebote schreiben" "kunden springen ab"
- site:haustechnikdialog.de "hausverwaltung" "manueller aufwand"
- https://www.g2.com/categories/landscaping-software
```

### Your Action After Phase 0
1. Read your 3 ideas. **Pick the ONE that excites you most.**
2. Move to Phase 0.5 (Source Scout).

---

## Phase 0.5: Source Scout (AI Finds Your Sources)

**Goal:** Tell the AI your chosen idea. It finds the exact competitors, Reddit threads, and keywords you need to load into NotebookLM.

**You do NOT need to know what to search for. The AI does it for you.**

### Run the Source Scout

In your IDE chat (Cursor/VS Code), tell Antigravity:
```text
Run the workflow /source-scout. My idea: A lead-qualification tool for German landscapers that filters out tire-kicker customers before the owner drives to the appointment.
```

### The Output

Antigravity searches Brave for competitors, Reddit complaints, and market data. It writes `docs/source-shopping-list.md` containing:
- **Exact competitor URLs** (homepage + pricing page) to add as sources
- **Exact Reddit/forum thread URLs** with real user complaints
- **Market data links** (blog posts, G2 categories)
- **Keywords** to use in NotebookLM's built-in source search feature

### Your Action After Phase 0.5
1. Open [NotebookLM](https://notebooklm.google.com/) → Create a new notebook.
2. Walk through the shopping list and add each source:
   - For **URLs**: Paste directly into NotebookLM's "Add Source" (it can import web pages).
   - For **PDFs**: Open the URL, `CMD+P` → Save as PDF, then upload.
   - For **Keywords**: Use NotebookLM's search feature to find additional sources.
3. Once all sources are loaded, move to Phase 1.

---

## Phase 1: The Deep Dive (NotebookLM + Researcher Agent)

**Goal:** Grill, validate, and stress-test your chosen idea until it's either confirmed as viable (GO) or killed (NO-GO).

Your NotebookLM notebook is now loaded with the sources from Phase 0.5. Time to extract insights and stress-test the idea.

### Step 1.1: Interactive Exploration (You + NotebookLM)

Your NotebookLM notebook is loaded with sources from Phase 0.5. Now use it as your personal analyst to sharpen the idea.

NotebookLM does NOT hallucinate — it only answers based on your uploaded documents. This makes it perfect for grounding your research in facts.

1. **Let NotebookLM pre-digest the material:**
   - Ask it: *"Summarize the top 3 competitor products and their biggest weaknesses."*
   - Ask it: *"What are the top 5 unresolved pain points across all the Reddit threads?"*
   - Ask it: *"Is there a gap that none of the competitors are addressing?"*
2. **Sharpen your idea by grilling it:**
   - *"Based on ALL sources: Would a solo developer tool that does X be viable? What's missing?"*
   - *"What would a customer need to see in a landing page to switch from [Competitor] to this?"*
   - *"What is the simplest possible pricing model for this, based on what competitors charge?"*
3. **Click Share → "Anyone with link" → Copy the link.**

> **Why this interactive step before the Researcher Agent?**
> NotebookLM lets you explore your data conversationally. You spot patterns, ask follow-ups, and refine your thesis. This produces a much sharper brief for the autonomous agent in Step 1.2.

### Step 1.2: Autonomous Validation (Researcher Agent)

Now that you've pre-digested the material in NotebookLM, unleash the **Researcher Agent** to write the formal validation.

**Option A: With NotebookLM Link (Recommended)**
```text
claude
> Use the researcher subagent to analyze the market for "A lead-qualification tool for German landscapers." NotebookLM: https://notebooklm.google.com/notebook/YOUR_ID
```

> **⚠️ IMPORTANT:** Do NOT use `/agent researcher` or `/research` — these are NOT slash commands!
> Agents are invoked by asking Claude to "Use the [name] subagent to..." — this triggers
> the Task tool which properly loads the agent's frontmatter (including model selection).

The Researcher Agent will:
1. Connect to your NotebookLM notebook and exhaust every source in it.
2. Cross-reference with live web search (Brave) for anything your notebook might have missed.
3. Act as a **"Skeptical Investor"** — actively looking for reasons why this will fail.
4. Write `docs/validation-report.md` containing:
   - Raw data summary (competitor pricing, Reddit sentiment)
   - The 3 biggest risks why this product could fail
   - A **Confidence Score** (1-100)
   - A clear **GO / NO-GO Recommendation**
5. If GO: Proceed to Phase 2 automatically.

**Option B: Web-Only (No NotebookLM)**
```text
claude
> Use the researcher subagent to analyze the market for "A lead-qualification tool for German landscapers."
```
The agent will use Brave Search MCP exclusively to find competitors, pricing, and pain points.

### Your Action After Phase 1
- **Read `docs/validation-report.md` carefully.** This is your reality check.
- If **GO** with high confidence: Move to Phase 2.
- If **NO-GO** or low confidence: Go back to Phase 0, pick another idea, and repeat.
- If **GO with caveats**: Feed the caveats back into NotebookLM as new questions, then re-run `/research`.

---

## Phase 2: The Bible (Project Spec)

**Goal:** Turn the validated idea into the one document that drives ALL development.

If the Researcher Agent gave a GO, it has already written `docs/project-spec.md`. But you should review and sharpen it:

1. **Read `docs/project-spec.md`** — Does every section feel specific and actionable?
2. **Back-check against NotebookLM** — Ask: *"Does the feature list in this spec match what users actually complained about?"*
3. **Lock it down.** Once approved, this is "The Bible." All code decisions trace back to this document.

*Result:* A 100% completed, validated `docs/project-spec.md`.

---

## Phase 3: Factory Setup (Initialize)

Once the spec ("The Bible") is ready, you start the machine.

1. Go to the GitHub Template: `https://github.com/m4rc0z/indie-ai-factory`
2. Click **"Use this template"** → Create your own repo (e.g., `my-new-saas`).
3. Clone your new repo locally:
   ```bash
   git clone git@github.com:YOUR_USER/your-new-saas.git
   cd your-new-saas
   ```
4. Run the setup script:
   ```bash
   ./setup.sh
   ```
   *(Pulls the skills, makes hooks executable, creates `.env.local` template.)*
5. **Copy your finished `project-spec.md` and `validation-report.md` into the `docs/` folder.**
6. **Set up Playwright MCP** (for browser-based E2E testing in Phase 6):
   ```bash
   claude mcp add playwright -s user -- npx -y @playwright/mcp@latest
   ```

> **Note:** Dependencies are NOT installed yet. The Architect Agent in Phase 4 will first select the optimal tech stack for your project.

### Hooks (Pre-Configured)

The template ships with **zero-token-cost automation hooks** in `.claude/settings.json`:

| Hook | Trigger | What It Does |
|:-----|:--------|:-------------|
| **PostToolUse** (Edit) | After every file edit | Auto-formats with Prettier |
| **PreToolUse** (Bash) | Before any bash command | Blocks `.env` file access (security) |
| **UserPromptSubmit** | When you send a prompt | Injects current git branch + last commit |

These run automatically outside the LLM — they consume zero tokens and execute instantly.

---

## Phase 4: Architecture & Tech Selection (Claude Code + Architect Agent)

This is where the magic happens. The **Architect Agent** reads your project spec and makes all technology decisions — optimizing for **cost-efficiency**, **solo-dev maintainability**, and **time-to-market**.

> **Why not hardcode the tech stack?** Every project is different. A simple lead-gen form doesn't need the same stack as a real-time dashboard. The Architect Agent evaluates your specific needs and picks the best tools.

1. **Start Claude Code (skipping permissions so the Architect can write files uninterrupted):**
   ```bash
   claude --dangerously-skip-permissions
   ```
2. **Run the Architect Agent:**
   ```text
   Use the architect subagent to read docs/project-spec.md, design the system architecture, and select the optimal tech stack.
   ```
3. **What happens automatically:**
   - Reads your project spec and validation report
   - Selects the best framework, database, payment provider, and deployment platform
   - Documents the rationale and **estimated monthly costs** for each choice
   - Writes `architecture.md` with route structure, database schema (ERD), and API contracts
   - Generates `schema.sql` with access policies
   - **Updates `CLAUDE.md`** with chosen tech stack, commands, and folder structure
   - **Updates `package.json`** with correct scripts
4. **Install dependencies (after Architect finishes):**
   ```bash
   npm install
   ```
5. **Review:** Read `.antigravity/artifacts/architecture.md` — Does the cost analysis make sense? Are the tech choices justified?

---

## Phase 5: The Heavy Build Run (Antigravity Night Mission)

Once the architecture and spec are ready, **Antigravity** takes over the heavy lift.

1. Open Cursor or VS Code, trigger Antigravity:
   ```text
   Load the project-spec.md and architecture.md into your Context Window. 
   Run the workflow /night-mission to build our MVP based on these documents.
   ```
2. **What happens next?**
   - Antigravity writes its own `task_plan.md`.
   - Builds the Design System (colors, styling).
   - Iteratively generates all components and pages.
   - Executes auto-commits and visually validates the UX.
   - You go to bed or grab a coffee. ☕

---

## Phase 6: The Iterative Loop (Build → Test → Brainstorm → Repeat)

Once the MVP is standing, you enter the **autonomous iteration loop**. This is where the product gets polished from "works" to "ships."

```
┌──────────────────────────────────────────────────┐
│           Phase 6: Iterative Loop                │
│                                                  │
│  1. QA Tester Agent → docs/qa-report.md          │
│     (brainstorms test scenarios, finds bugs)     │
│              ↓                                   │
│  2. Bug Fixer Agent → auto-fixes bugs            │
│     (TDD: write test → fix → verify → commit)    │
│              ↓                                   │
│  3. Product Thinker Agent                        │
│     → docs/next-features.md                      │
│     (proposes next features, prioritized)        │
│              ↓                                   │
│  4. YOU decide: Which feature next?              │
│              ↓                                   │
│  5. Claude Code → Implements the feature         │
│              ↓                                   │
│  └──────── Back to 1. ───────────────────────┘   │
└──────────────────────────────────────────────────┘
```

### Step 6.1: QA Testing + E2E Test Writing (Find What's Broken)

Start Claude Code and run the QA Tester agent:

```bash
claude --dangerously-skip-permissions
```
```text
Use the qa-tester subagent to test the application and create docs/qa-report.md
```

The QA Tester will:
- **Brainstorm user test scenarios** before testing anything
- **Write persistent Playwright E2E tests** in `e2e/` that stay in the codebase
- Run all tests (unit + E2E) and document results
- Systematically test everything that can't be automated (visual, performance)
- Check responsive design, accessibility, and security
- Write `docs/qa-report.md` with prioritized bugs

> **Key Insight**: E2E tests make the feedback loop **10x faster**. After the first QA run,
> every subsequent change can be verified with `npx playwright test` in seconds instead of
> minutes of manual clicking.

### Step 6.2: Auto-Fix Bugs (Bug Fixer Agent)

If the QA report found bugs, let the Bug Fixer handle them autonomously:

```text
Use the bug-fixer subagent to resolve the issues in docs/qa-report.md
```

The Bug Fixer will:
- Read `docs/qa-report.md` and triage bugs by severity
- For each bug: write a failing test → fix the code → verify → commit
- Mark each bug as ✅ FIXED in the QA report
- One bug = one commit (clean git history)

### Step 6.3: Feature Brainstorming (What Should We Build Next?)

Run the Product Thinker agent:

```text
Use the product-thinker subagent to brainstorm new features based on the project spec
```

The Product Thinker will:
- Compare the spec vs. what's actually built (gap analysis)
- Optionally research competitor features via web search
- Score features using the ICE framework (Impact × Confidence × Ease)
- Write `docs/next-features.md` with 3 prioritized feature tickets

### Step 6.4: You Decide (The Only Manual Step)

Read both reports and pick your next action:
- **Bug from QA report?** → Tell Claude Code to fix it.
- **Feature from next-features.md?** → Tell Claude Code to build it.
- **Your own idea?** → Describe it to Claude Code.

Use the WHAT/WHERE/HOW/VERIFY formula:
```text
WHAT: Add PDF download button to the price estimate page
WHERE: src/app/price-estimate/page.tsx + src/lib/pdf/generator.ts (new)
HOW: Use @react-pdf/renderer. Generate a branded PDF with the estimate details.
VERIFY: npm run build && npm run test
```

### Step 6.5: Verify (Close the Loop)

After Claude Code implements the change:
1. Run QA Tester again to verify the fix/feature works
2. Commit: `git commit -m "feat: add PDF download for estimates"`
3. Back to Step 6.1

### Daily Workflow Commands

| Time | Action | Command |
|:-----|:-------|:--------|
| Morning | Check status | `/health` |
| Morning | Run QA | `/agent qa-tester` |
| During day | Build features | WHAT/WHERE/HOW/VERIFY prompts |
| During day | Clean context | `/compact` |
| Evening | Get review | `/agent qa-tester` (verify) |
| Evening | Handoff | `/handoff` |

---

## Quick Reference: The Artifact Chain

| Phase | Tool | Input | Output |
|:------|:-----|:------|:-------|
| 0: Ideation | Antigravity `/ideation` or Claude `/ideate` | Your skills + interests | `docs/ideation-results.md` |
| 0.5: Source Scout | Antigravity `/source-scout` | Your chosen idea | `docs/source-shopping-list.md` |
| 1: Deep Dive | NotebookLM + Claude `/research` | NotebookLM link (loaded with sources) | `docs/validation-report.md` |
| 2: The Bible | Researcher Agent (auto) + Human review | Validation report | `docs/project-spec.md` |
| 3: Setup | `./setup.sh` | Template repo | Initialized project (no deps yet) |
| 4: Architecture | Claude Code (`/agent Architect`) | `project-spec.md` | `architecture.md` + `schema.sql` + updated `CLAUDE.md` |
| 5: Night Mission | Antigravity `/night-mission` | Spec + Architecture | Working MVP |
| 6a: QA | Claude Code (`/agent qa-tester`) | Running app | `docs/qa-report.md` |
| 6b: Brainstorm | Claude Code (`/agent product-thinker`) | Code + Spec + QA report | `docs/next-features.md` |
| 6c: Build | Claude Code | Feature ticket | Implemented feature |
| 6d: Verify | Claude Code (`/agent qa-tester`) | Updated app | Updated `docs/qa-report.md` |

---

## Advanced Tools & Patterns

### Playwright MCP (Browser Testing)

The Playwright MCP server lets Claude Code control a real browser — navigate pages, fill forms, take screenshots, and run E2E tests.

```bash
# Setup (one-time, already included in Phase 3)
claude mcp add playwright -s user -- npx -y @playwright/mcp@latest
```

This powers the QA Tester agent's ability to write persistent E2E tests.

### GSD Plugin (Context-Rot Prevention)

For large, multi-phase features, use the **GSD (Get Shit Done)** plugin to prevent context degradation:

```bash
npx get-shit-done-cc@latest
```

GSD spawns specialized sub-agents with **fresh context** for each task. Each sub-agent gets the full 200K context window instead of sharing a degraded one. Use it when a single Claude Code session isn't enough.

### OpusPlan Mode

Use **Opus for planning** and **Sonnet for execution** — the best of both worlds:
- Start with `Use the architect subagent to...` (Opus thinks through architecture)
- Then `Use the bug-fixer subagent to...` (Sonnet executes cheaply and fast)

Our agents already follow this pattern: Architect + Researcher use Opus, everything else uses Sonnet.

### Multi-Instance Workflows

You can run 2-3 Claude Code instances in parallel on independent tasks:

| Terminal | Task | Working On |
|:---------|:-----|:-----------|
| Terminal 1 | Bug fixing | `src/components/` |
| Terminal 2 | New feature | `src/app/new-page/` |
| Terminal 3 | Test expansion | `e2e/` |

Works best when tasks touch **different files**. Merge carefully when they overlap.

---

## Available Agents

All agents are defined in `.claude/agents/` and are natively available in Claude Code via `/agent [name]`:

| Agent | Purpose | Model | When to Use |
|:------|:--------|:------|:------------|
| **Architect** | Tech stack selection & system design | Opus | Phase 4 (once per project) |
| **Researcher** | Market research & spec generation | Opus | Phase 1-2 (once per project) |
| **Product Thinker** | Feature brainstorming & prioritization | Sonnet | Phase 6 (every iteration) |
| **QA Tester** | E2E test writing, systematic testing & bug hunting | Sonnet | Phase 6 (every iteration) |
| **Bug Fixer** | Autonomous bug fixing with TDD | Sonnet | Phase 6 (after QA) |
| **Debugger** | Hypothesis-driven debugging | Sonnet | Anytime (on specific bugs) |
| **Reviewer** | Security-focused code review | Sonnet | Before deploy |
| **Ideator** | Niche discovery & idea brainstorming | Sonnet | Phase 0 (new products) |

---
*The Indie AI Factory ensures you never start with a blank page, enforces architectural best practices, and uses AI resources (tokens, context window) globally with maximum efficiency.*

