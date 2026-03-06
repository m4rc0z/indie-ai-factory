# The Claude Code-Only Workflow (Antigravity Bypass)

Yes, you can execute the entire Indie AI Factory process **exclusively with Claude Code**, without ever using Antigravity or a browser-based agent. 

The end product will be the same high-quality code. The main difference is **how visual Quality Assurance (QA) is handled**. Antigravity can physically open a browser, take screenshots, and fix CSS visually. Claude Code relies on you (the human) to look at the browser, or on automated E2E tests (like Playwright).

If you prefer to stay entirely in the terminal, follow this guide to adapt Phases 5 and 6.

---

## Phases 0 to 4: No Changes
Phases 0 through 4 (Ideation, Validation, Spec, and Architecture) are *already* designed to be run 100% in Claude Code using your Subagents (`Ideator`, `Researcher`, `Architect`). Run them exactly as described in `factory-workflow.md`.

---

## Phase 5: The Build Run (Claude Code Edition)

Instead of handing off to Antigravity's `/night-mission`, we turn Claude Code into a relentless implementation engine. Since Claude Code has a context window, it's best to break the build into smaller "Tickets".

### Step 5.1: Ticket Generation
Ask Claude Code to act as the Tech Lead and break the architecture down into bite-sized tickets.

```text
Use the architect subagent to read architecture.md and project-spec.md. 
Break the entire MVP implementation down into 4-6 sequential tickets. 
Write them to docs/tickets.md. 
Include the exact files to create and the acceptance criteria for each ticket.
```

### Step 5.2: Iterative Execution
Now, work through the tickets one by one using Claude Code. Start a new session or `/compact` frequently to save tokens.

```text
Claude, implement Ticket #1 from docs/tickets.md.
Follow the standards in CLAUDE.md.
When you are done, run the build command to verify there are no type errors, then commit the changes.
```

*Repeat this prompt for Ticket #2, #3, etc.*

### Step 5.3: Manual Visual Sync
Since Claude cannot see the rendered frontend, act as its eyes.
1. Start the dev server (`npm run dev`).
2. Open the browser.
3. If it looks ugly or broken, describe it to Claude:
   > "The pricing cards on /pricing are stacked on top of each other instead of side-by-side. The contrast on the primary button is too low. Please fix the Tailwind classes."

---

## Phase 6: QA & Polish (Claude Code Edition)

Without Antigravity's built-in visual browser, we enforce visual quality through **MCP Servers** and **Local Skills**.

### Step 6.0: The Visual Hack (Puppeteer MCP)
To give Claude Code "eyes", you must install the official Puppeteer MCP server. This allows Claude to actually navigate your local dev server, take screenshots, and analyze the CSS.

```bash
claude mcp add puppeteer npx -y @modelcontextprotocol/server-puppeteer
```

### Step 6.1: Visual Design Validation
Once your dev server is running (`npm run dev`), instruct Claude to act as a rigorous design critic using your local skills.

```text
Load the skill .agent/skills/awesome-collection/skills/ui-ux-pro-max/SKILL.md. 
Navigate to localhost:3000 using puppeteer, take a screenshot, and critically evaluate the design based on the skill's rules. Then, fix the Tailwind classes to improve contrast and spacing.
```

### Step 6.2: Visual QA & Bug Hunting
For rigorous layout testing (e.g., checking mobile responsiveness or layout shifts):

```text
Load the skill .agent/skills/awesome-collection/skills/ui-visual-validator/SKILL.md.
Take a screenshot of localhost:3000/pricing and strictly verify if there are any visual bugs, layout shifts, or accessibility issues.
```

### Step 6.1: Security & Code Review
Before launching, have the Reviewer subagent check your codebase.

```text
Use the reviewer subagent to scan the entire codebase for security vulnerabilities, missing authentication checks, and database RLS policy issues. Write a report to docs/security-audit.md.
```

### Step 6.2: Automated E2E Testing (The Antigravity Alternative)
Instead of an AI clicking around the UI, have Claude write robust Playwright tests that simulate user behavior.

```text
Claude, set up Playwright tests for the core user flow (Signup -> Dashboard -> Create Project). 
Run the tests and fix any bugs you encounter until all tests pass in head-less mode.
```

### Step 6.3: The Debugging Loop
When a user (or you) finds a bug in production or staging, use the specialized Debugger subagent.

```text
Use the debugger subagent. I am getting a 500 error when clicking 'Submit' on the lead form. The terminal says 'Failed to parse JSON'. Find the root cause and fix it.
```

---

## Summary of Differences

| Feature | Antigravity (Default) | Claude Code-Only |
| :--- | :--- | :--- |
| **Pacing** | One massive "Night Mission" prompt | Iterative, ticket-by-ticket approach |
| **Visual QA** | Built-in browser subagent | Puppeteer MCP + Local UI Skills |
| **Testing** | Autonomous clicking + Playwright | Code + Playwright/Vitest (with MCP) |
| **Context Tooling** | Custom IDE extensions | Native `/compact` and `/.claude` config |

**Conclusion:** The Claude Code-only route is often *faster* for pure backend/logic-heavy building. With the addition of the Puppeteer MCP server, it can now nearly match Antigravity's visual QA capabilities, bridging the final gap between terminal and browser.
