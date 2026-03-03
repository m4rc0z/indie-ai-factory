# The Indie AI Factory Workflow 🏭

This document outlines the exact end-to-end process of taking an idea and turning it into a revenue-generating product using the Indie AI Factory stack (NotebookLM, Claude Code, and Antigravity).

---

## Phase 1: Research & "The Bible" (Idea to Spec)

Before writing any code, the idea must be validated and structured into our strictly formatted `docs/project-spec.md`. You have two powerful ways to do this:

### Option A: The Deep Dive Approach (NotebookLM)
NotebookLM acts as your strategic co-founder. Because it grounds its answers strictly in the documents you provide, it is perfect for synthesizing chaotic market data into a clean spec.

1. **Source Gathering:** 
   - Save as PDFs: Websites of 3-5 competitors, pricing pages, feature lists.
   - Copy top Reddit threads or Hacker News discussions about the specific problem.
   - Upload everything into a new [NotebookLM](https://notebooklm.google.com/) project.
2. **Initial Prompt:**
   - Upload the empty `docs/project-spec.md` template to NotebookLM or paste its structure into the chat.
   - *Prompt:* `"Based on our sources, fill out this Project Spec Template completely. Analyze our competitors and find our 'Unfair Advantage'. Be very specific about the Revenue Model and the Go-to-Market Strategy."*
3. **The "Grilling" Session (Refinement):**
   - Don't accept the first draft immediately. "Grill" the notebook:
   - *Prompt 1:* `"Is the pricing model realistic compared to the competitors in the document? What is the willingness to pay of the cited Reddit users?"*
   - *Prompt 2:* `"The Go-to-Market strategy is too generic. How do we get our first 10 customers in week 1 with a $0 budget based on the sources?"*
   - *Prompt 3:* `"Create a detailed feature counter-proposal to [Competitor X]. What can we omit in V1 to launch faster?"*

### Option B: The Autonomous Approach (Claude Desktop/Code + MCP)
If you don't want to gather sources manually, let an AI with **MCP (Model Context Protocol)** scour the web for you and write the spec autonomously.

1. **Setup:** Use Claude Desktop or Claude Code with installed MCP servers (e.g., `Brave Search MCP` or `Puppeteer MCP`).
2. **The Mega-Prompt:** 
   ```text
   Use the Brave Search MCP to analyze the market for [YOUR IDEA].
   1. Find the top 3 competitors and their pricing models.
   2. Find out what users hate about these products (Search for "site:reddit.com alternative to [Competitor]").
   3. Once you have enough data, write down the findings strictly following the format of the file `docs/project-spec.md`.
   ```
3. **Iterative Refinement:** The AI can execute follow-up tasks directly via MCP (*"Read the changelog of Competitor X specifically and see what they built recently."*).

*Result of Phase 1:* A 100% completed `docs/project-spec.md`.

---

## Phase 2: Factory Setup (Initialize)

Once the spec ("The Bible") is ready, you start the machine.

1. Go to the GitHub Template: `https://github.com/m4rc0z/indie-ai-factory`
2. Click **"Use this template"** → Create your own repo (e.g., `my-new-saas`).
3. Clone your new repo locally on your Mac:
   ```bash
   git clone git@github.com:YOUR_USER/your-new-saas.git
   cd your-new-saas
   ```
4. Run the setup script:
   ```bash
   ./setup.sh
   ```
   *(Pulls the skills, installs dependencies, builds the `.env.local` template).*
5. **Copy your finished `project-spec.md` into the `docs/` folder.**

---

## Phase 3: Architecture & Foundation (Claude Code)

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

## Phase 4: The Heavy Build Run (Antigravity Night Mission)

Once the architecture and spec are ready, **Antigravity** takes over the heavy lift (the initial build of the UI/UX, pages, and logical components).

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

## Phase 5: The Daily Loop (Iterate & Ship)

When the MVP is 80% done, you switch to the fast Daily Workflow, optimized by our *Claude Code Best Practices*:

- **Morning (Status Check):**
  Use the new slash command via Claude Code:
  ```bash
  /health
  ```
- **During the day (Building):**
  Use Claude Code for feature implementations using the WHAT/WHERE/HOW/VERIFY formula.
  IMPORTANT: Limit tasks. One Feature = One Context. Once finished:
  ```bash
  /compact
  ```
- **Get Code Reviews:**
  Before you push, let the Security Agent look over it:
  ```bash
  /agent reviewer "Check if the new Stripe webhook route is secure."
  ```
- **Evening (Handoff):**
  Clean up for the next day or for another Night Mission:
  ```bash
  /handoff
  ```

---
*The Indie AI Factory ensures you never start with a blank page, enforces architectural best practices, and uses AI resources (tokens, context window) globally with maximum efficiency.*
