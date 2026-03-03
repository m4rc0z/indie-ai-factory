# The Indie AI Factory Workflow 🏭

This document outlines the exact end-to-end process of taking a vague interest and turning it into a validated, revenue-generating product using the Indie AI Factory stack.

**The Golden Rule:** Each phase produces a specific artifact that feeds the next. Never skip a phase. Never start coding before the spec is battle-tested.

```
Phase 0: Ideation          → Output: docs/ideation-results.md (3 raw ideas + search queries)
    ↓ (You pick ONE idea)
Phase 1: The Deep Dive      → Output: docs/validation-report.md (GO / NO-GO)
    ↓ (If GO)
Phase 2: The Bible           → Output: docs/project-spec.md (100% complete)
    ↓
Phase 3: Factory Setup       → Clone template, ./setup.sh
    ↓
Phase 4: Architecture        → Output: architecture.md + schema.sql
    ↓
Phase 5: The Night Mission   → Antigravity builds the MVP
    ↓
Phase 6: The Daily Loop      → Iterate & Ship
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
2. Run the search queries the Ideator gave you. Save the results (Reddit threads, competitor websites, G2 reviews) as PDFs or text files.
3. Move to Phase 1.

---

## Phase 1: The Deep Dive (NotebookLM + Researcher Agent)

**Goal:** Grill, validate, and stress-test your chosen idea until it's either confirmed as viable (GO) or killed (NO-GO).

This phase has two sub-steps: first you build a "knowledge base" in NotebookLM, then you unleash the Researcher Agent on it.

### Step 1.1: Build Your NotebookLM Knowledge Base

NotebookLM is Google's RAG system. It does NOT hallucinate because it only answers based on documents YOU provide. This makes it perfect for grounding your research in facts.

1. **Open [NotebookLM](https://notebooklm.google.com/)** → Create a new notebook for your idea.
2. **Upload everything you gathered in Phase 0:**
   - PDFs of competitor websites (pricing pages, feature lists, about pages)
   - Copied Reddit threads where users complain about existing solutions
   - G2/Capterra review pages saved as PDFs
   - Any industry reports or blog posts about the niche
3. **Let NotebookLM pre-digest the material:**
   - Ask it: *"Summarize the top 3 competitor products and their biggest weaknesses."*
   - Ask it: *"What are the top 5 unresolved pain points across all the Reddit threads?"*
   - Ask it: *"Is there a gap that none of the competitors are addressing?"*
4. **Sharpen your idea by grilling it:**
   - *"Based on ALL sources: Would a solo developer tool that does X be viable? What's missing?"*
   - *"What would a customer need to see in a landing page to switch from [Competitor] to this?"*
   - *"What is the simplest possible pricing model for this, based on what competitors charge?"*
5. **Click Share → "Anyone with link" → Copy the link.**

> **Why NotebookLM before the Researcher Agent?**
> NotebookLM lets you interactively explore your data. You ask follow-up questions, spot patterns, and refine your thesis. This human-in-the-loop exploration produces a much sharper "brief" for the autonomous agent in Step 1.2.

### Step 1.2: Autonomous Validation (Researcher Agent)

Now that you've pre-digested the material in NotebookLM, unleash the **Researcher Agent** to write the formal validation.

**Option A: With NotebookLM Link (Recommended)**
```bash
claude
> /research "A lead-qualification tool for German landscapers. NotebookLM: https://notebooklm.google.com/notebook/YOUR_ID"
```

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
```bash
claude
> /research "A lead-qualification tool for German landscapers."
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
   *(Pulls the skills, installs dependencies, builds the `.env.local` template.)*
5. **Copy your finished `project-spec.md` and `validation-report.md` into the `docs/` folder.**

---

## Phase 4: Architecture & Foundation (Claude Code)

Use *Claude Code* (`claude` in the terminal) for the extremely fast, token-efficient setup of the data model and architecture.

1. **Start Claude Code:**
   ```bash
   claude
   ```
2. **Plan Architecture:**
   `"Read docs/project-spec.md. Write a technical architecture plan (Route structure, Supabase tables, n8n webhooks) into a new file .antigravity/artifacts/architecture.md. Adhere to our stack defined in CLAUDE.md."`
3. **Generate Database Schema:**
   `"Based on architecture.md, create the SQL schema for Supabase under supabase/schema.sql including RLS Policies."`

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
   - Builds the Design System (colors, Tailwind).
   - Iteratively generates all components and pages.
   - Executes auto-commits and visually validates the UX.
   - You go to bed or grab a coffee. ☕

---

## Phase 6: The Daily Loop (Iterate & Ship)

When the MVP is 80% done, you switch to the fast Daily Workflow:

- **Morning (Status Check):**
  ```bash
  /health
  ```
- **During the day (Building):**
  Use Claude Code for feature implementations using the WHAT/WHERE/HOW/VERIFY formula.
  One Feature = One Context. Once finished:
  ```bash
  /compact
  ```
- **Get Code Reviews:**
  ```bash
  /agent reviewer "Check if the new Stripe webhook route is secure."
  ```
- **Evening (Handoff):**
  ```bash
  /handoff
  ```

---

## Quick Reference: The Artifact Chain

| Phase | Tool | Input | Output |
|:------|:-----|:------|:-------|
| 0: Ideation | Antigravity `/ideation` or Claude `/ideate` | Your skills + interests | `docs/ideation-results.md` |
| 1: Deep Dive | NotebookLM + Claude `/research` | PDFs + idea from Phase 0 | `docs/validation-report.md` |
| 2: The Bible | Researcher Agent (auto) + Human review | Validation report | `docs/project-spec.md` |
| 3: Setup | `./setup.sh` | Template repo | Initialized project |
| 4: Architecture | Claude Code | `project-spec.md` | `architecture.md` + `schema.sql` |
| 5: Night Mission | Antigravity `/night-mission` | Spec + Architecture | Working MVP |
| 6: Daily Loop | Claude Code + Antigravity | Feature tickets | Production app |

---
*The Indie AI Factory ensures you never start with a blank page, enforces architectural best practices, and uses AI resources (tokens, context window) globally with maximum efficiency.*
