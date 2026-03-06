# AI Process Manifest (Indie AI Factory)

> **SYSTEM INSTRUCTION FOR AI AGENTS:** If you are an AI reading this file, this is the Master Standard Operating Procedure (SOP) for the Indie AI Factory. Use this document to orient yourself. You are playing a specific role in an end-to-end product development lifecycle.

## Objective
The Indie AI Factory is a systematic process for turning vague ideas into validated, revenue-generating SaaS products. It enforces a strict sequence of phases. **No code is written until the market is validated and the architecture is designed.**

This process is **agent-agnostic**. Whether you are Claude Code, Antigravity, Kimi, Cursor, or another LLM, your job is to execute the current phase by consuming the *Required Input* and generating the *Expected Output*.

---

## The Core Process

### Phase 0: Ideation
**Goal:** Generate 3 hyper-specific, boring B2B SaaS ideas based on the user's skills and interests.
- **Required Input:** User's natural language description of skills and interests.
- **Expected Actions:** 
  1. Scrape the web (Reddit, forums, software review sites) for real complaints and pain points.
  2. Filter out bad ideas (no AI wrappers, no B2C, no 2-sided marketplaces).
- **Expected Output:** `docs/ideation-results.md` containing 3 validated ideas and the exact search queries used.

### Phase 0.5: Source Scout
**Goal:** Find the exact competitor URLs and Reddit threads to load into NotebookLM for deep research.
- **Required Input:** The single selected idea from Phase 0.
- **Expected Actions:** Search the web for direct competitors and user complaints.
- **Expected Output:** `docs/source-shopping-list.md` (A list of URLs and keywords).

### Phase 1: The Deep Dive (Validation)
**Goal:** Act as a skeptical investor. Prove why the idea will fail. If it survives, give it a GO.
- **Required Input:** A NotebookLM link containing the sources, OR live web search access.
- **Expected Actions:** Analyze competitors, pricing models, and user complaints. Systematically look for fatal flaws.
- **Expected Output:** `docs/validation-report.md` (Risk analysis, Confidence Score 1-100, GO/NO-GO recommendation).

### Phase 2: The Project Spec ("The Bible")
**Goal:** Create the single source of truth for all development.
- **Required Input:** `docs/validation-report.md`.
- **Expected Actions:** Draft a comprehensive product specification (MVP scope, user personas, core features, non-features).
- **Expected Output:** `docs/project-spec.md`.

### Phase 3: Environment Setup
**Goal:** Initialize the repository.
- **Required Input:** The Indie AI Factory GitHub template.
- **Expected Actions:** Clone the template, run `./setup.sh`, and copy the spec and validation reports into the `docs/` folder.
- **Expected Output:** An initialized local repository (no dependencies installed yet).

### Phase 4: Architecture
**Goal:** Select the optimal technology stack and design the database.
- **Required Input:** `docs/project-spec.md`.
- **Expected Actions:** Evaluate the spec and choose the most cost-effective, maintainable stack for a solo developer.
- **Expected Output:** 
  - `architecture.md` (System design, route structure, chosen stack with cost estimates).
  - `schema.sql` (Database schema and RLS policies).
  - `package.json` and `CLAUDE.md` updated with the chosen stack's commands.

### Phase 5: The Build Run (MVP Implementation)
**Goal:** Build the complete functional prototype based on the architecture.
- **Required Input:** `docs/project-spec.md` and `architecture.md`.
- **Expected Actions:** Step-by-step implementation of all required UI components, backend logic, and database connections. Write tests for core logic.
- **Expected Output:** A working web application capable of running locally via `npm run dev`.

### Phase 6: Iterative Polish (QA & Bug Fixing)
**Goal:** Turn "works" into "production-ready" through automated testing and visual validation.
- **Required Input:** The running MVP.
- **Expected Actions:** 
  1. Play the role of QA Tester: Write Playwright E2E tests, find edge cases, produce `docs/qa-report.md`.
  2. Play the role of Bug Fixer: Auto-fix the issues in the report.
  3. Play the role of Visionary: Use visual validation tools (like Puppeteer MCP + UI Skills) to audit design aesthetics and correct CSS.
- **Expected Output:** A polished, secure, and visually stunning V1 ready for deployment.

---

## General Rules for AI Agents

1. **Context is King:** Always read the artifacts from the previous phase before starting your work.
2. **Be Destructive in Planning, Constructive in Building:** During Phase 1-2, look for reasons to kill the project. During Phase 5-6, execute relentlessly to make it work.
3. **No Placeholders:** Never generate boilerplate comments like `// implement logic here`. Write the actual, functional code.
4. **Assume the UI Must "Wow":** During Phase 5 and 6, apply modern UI/UX principles (Tailwind v4, Framer Motion, proper contrast, and spacing). A functional but ugly UI is considered a failure. Use visual MCP tools to verify.
