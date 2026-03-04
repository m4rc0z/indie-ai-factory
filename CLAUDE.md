# CLAUDE.md — Layer 1: Persistent Memory

> This file is automatically loaded by Claude Code on every session.
> It defines project-agnostic coding standards, operational rules, and the tech selection process.
> **Rule**: Only add new rules when Claude makes the same mistake twice. No premature rules.
> **Target size**: 4–8 KB. Use `@path/to/file` import syntax to split large files into modules.

---

## 🤖 Mandatory Agent Dispatch (AUTO-WIRING)

> **CRITICAL**: These rules are not optional. They define WHEN each agent/command is auto-invoked.
> Violating these rules is equivalent to skipping tests — never acceptable.

| Trigger | Action | Agent / Command |
|---------|--------|----------------|
| **Bug detected or error thrown** | STOP. Invoke agent first. | `debugger` agent |
| **Any auth / RLS / permissions code changed** | MUST run before commit. | `security-reviewer` agent |
| **Any payment / billing code changed** (Stripe, webhooks) | MUST run before commit. | `security-reviewer` agent |
| **Building any UI component or front-end page** | Explicitly load frontend skill into context. | `@.claude/skills/frontend-design.md` |
| **Feature >3 files or multi-phase** | Use GSD to prevent context rot. | `npx get-shit-done-cc@latest` |
| **Complex architecture decision** | Use Opus to plan first. | `/model opusplan` |

### Auto-Dispatch in Practice

```
# Bug reported → always do this:
/agent debugger "Error: [paste error here]"

# About to commit auth/Stripe code → always do this:
/agent security-reviewer "Review src/auth/ and src/payments/ for vulnerabilities"

# Building UI → mention the skill explicitly in context
"Build a new dashboard layout. Use the frontend-design skill."
```

### Never Skip These Gates
- ❌ Fixing a bug without `debugger` agent first = forbidden for non-obvious bugs
- ❌ Changing auth/RLS/Stripe without `security-reviewer` = forbidden

---

## 🏗️ Tech Stack

> **This section is populated by the Architect Agent in Phase 4.**
> The template ships stack-agnostic. The Architect subagent chooses the optimal technologies
> based on the project's `docs/project-spec.md` — optimizing for **cost-efficiency**, **solo-dev maintainability**, and **time-to-market**.

| Layer | Technology | Chosen Because |
| :--- | :--- | :--- |
| **Framework** | _TBD by Architect_ | — |
| **Language** | _TBD by Architect_ | — |
| **Styling** | _TBD by Architect_ | — |
| **Backend/DB** | _TBD by Architect_ | — |
| **Payments** | _TBD by Architect_ | — |
| **Automation** | n8n (Webhooks only) | Self-hosted, already in stack |
| **Testing** | _TBD by Architect_ | — |
| **Deployment** | _TBD by Architect_ | — |

## 📋 Commands

> **Updated by the Architect Agent after tech selection.**

```bash
# Development
npm run dev          # Start dev server
npm run build        # Production build
npm run start        # Start production server

# Testing
npm run test         # Run unit tests
npm run test:watch   # Watch mode
npm run test:e2e     # Run E2E tests

# Quality
npm run lint         # Linter
npm run format       # Formatter --write
npm run format:check # Formatter --check

# Monitoring
/cost                # Show session token usage & cost
/doctor              # Check system configuration
```

---

## 📐 Coding Standards

### File Naming
- Components: `PascalCase.tsx` (e.g., `PricingCard.tsx`)
- Utilities: `camelCase.ts` (e.g., `formatDate.ts`)
- API Routes: Framework-specific (e.g., `route.ts` for Next.js, `+server.ts` for SvelteKit)
- Types: `types.ts` co-located with feature

### Architecture
> The folder structure is defined by the Architect Agent based on the chosen framework.
> It will be documented here after Phase 4.
>
> **Folder-level CLAUDE.md**: For large features, add a CLAUDE.md inside the module folder
> (e.g., `src/lib/payments/CLAUDE.md`) with module-specific context and conventions.

### Code Rules
1. **Server-first by default** — Minimize client-side JavaScript.
2. **No `any` types** — Use `unknown` and type guards instead.
3. **Error handling** — Every page/route needs proper error boundaries.
4. **Loading states** — Every data-fetching page needs loading feedback.
5. **Input validation** — All API inputs validated (Zod, Valibot, or equivalent).

### Agentic Codebase Principles (Write code for the next agent, not just for humans)
- **Explicit > Clever** — Agents understand straightforward code better than magic.
- **Descriptive names** — `getUserByEmail()` not `getU()`. Name reveals intent.
- **Inline comments** — Provide context agents can't infer from code alone.
- **Clear module boundaries** — One responsibility per file/module.
- **No magic** — Avoid implicit conventions and undocumented patterns.
- **ADRs** — Keep `docs/decisions/` with Architecture Decision Records for long-term context.

---

## 🎯 Prompting Pattern: WHAT / WHERE / HOW / VERIFY

Use this pattern for every Claude Code task:

| Part | Purpose | Example |
| :--- | :--- | :--- |
| **WHAT** | What needs to happen | "Implement payment checkout session" |
| **WHERE** | Which files/modules | "src/lib/payments/checkout.ts" |
| **HOW** | Constraints, conventions | "Use the chosen payment provider. Follow their SDK guide." |
| **VERIFY** | How to confirm success | "npm run build && npm run test" |

**Bad prompt**: "Fix the auth bug"
**Good prompt**: "Fix the JWT validation in src/auth/middleware.ts — tokens with expired refresh claims are not returning 401. Add test coverage."

---

## 🧠 Advanced Prompting Patterns

### Structured Prompting with XML Tags
For complex or multi-part requests, use XML tags to organize the prompt:

```
<instruction>Refactor the payment processing module to support Stripe webhooks.</instruction>
<context>
- Current payment flow is in src/payments/
- We use Stripe API v2023-10
- Webhook endpoint should be POST /api/webhooks/stripe
</context>
<constraints>
- Must be backward compatible with existing orders
- Add idempotency checks for duplicate events
- Include comprehensive error handling
</constraints>
<output>Create the webhook handler, add tests, update API routes.</output>
```

### Semantic Anchors
Use precise technical terms to activate better patterns in the model.
Vague terms → vague results. Claude knows all design patterns, architecture concepts,
and best practices — use the right keywords (e.g., "idempotent", "CQRS", "optimistic locking").

### Prompting as Provocation
Three patterns to challenge the model instead of just instructing it:
- **The Gatekeeper**: "Only implement this if you are 100% sure. Otherwise ask questions first." — prevents hasty coding.
- **The Proof Demand**: "Show me proof in the code that your approach works. No assumptions." — forces verification.
- **The Reset**: "Forget your previous approach. Start from zero and find a better solution." — breaks stuck patterns.

### Rev the Engine (Multi-Round Planning)
Complex tasks need multiple planning rounds before you write code:
1. "Analyze the problem and propose an approach."
2. "What could go wrong? Which edge cases are missing?"
3. "Revise the plan based on those concerns."
4. "Now implement the final plan."

Multi-round planning significantly reduces errors compared to direct coding.

---

## ⚡ Feedback Loop Optimization

> The #1 investment for AI-assisted dev: make your feedback loop **as fast as possible**.

- **Fast cycle (< 5s)** = Claude can iterate 10+ times autonomously = High quality
- **Slow cycle (> 2min)** = Claude guesses instead of verifying = Low quality
- **No cycle** = Claude writes blind = Dramatic quality drop

**Rules**:
1. Keep unit tests fast. Split slow tests into a separate suite.
2. Prefer fast test runners (Vitest > Jest).
3. Run only affected tests during development.

---

## ✅ Mandatory Validation Loop

> **CRITICAL**: After EVERY code change, you MUST run this validation loop before moving on.
> Skipping this loop is NEVER acceptable. This is what separates quality from guessing.

```bash
# 1. Run tests (unit + E2E)
npm run test 2>&1 || true
npm run test:e2e 2>&1 || true

# 2. Type-check + build
npm run build

# 3. Review your own diff
git diff --stat
```

**Rules:**
1. If tests fail → fix immediately before continuing.
2. If build fails → fix immediately before continuing.
3. If the diff looks larger than expected → stop and reconsider your approach.
4. Only commit after all 3 steps pass.

---

## 🪝 Hooks (Zero-Token Automation)

> Hooks are shell scripts triggered by Claude Code events. They cost **zero tokens** and run instantly.
> Configured in `.claude/settings.json`.

| Hook | Trigger | What It Does |
|:-----|:--------|:-------------|
| **PostToolUse** (Edit) | After every file edit | Auto-formats with Prettier |
| **PostToolUse** (any) | After every tool use | Logs tool name + timestamp to `logs/tool_use.json` |
| **PreToolUse** (Bash) | Before any bash command | Blocks `.env` file access (security) |
| **UserPromptSubmit** | When you send a prompt | Injects current git branch + last commit |

These run automatically — no action needed from Claude or the user.

---

## 🔌 MCP Servers

> Each MCP server adds tool definitions to context. Only activate what you are actively using.
> MCP Registry: registry.modelcontextprotocol.io

| Server | What It Provides | Install Command |
|--------|-----------------|----------------|
| **Memory** | Persistent context across sessions. Saves conventions, preferences, decisions. | `claude mcp add memory -s user -- npx -y @mcp/server-memory` |
| **Context7** | Up-to-date library docs. Prevents hallucinated APIs. | `claude mcp add context7 -s user -- npx -y @context7/mcp@latest` |
| **Sequential Thinking** | Structured problem decomposition. Breaks complex problems into steps. | `claude mcp add seq-thinking -s user -- npx -y @mcp/server-sequential-thinking` |
| **Serena** | Code-aware navigation. Understands symbols, references, types. 15+ languages. | See Serena docs |
| **Playwright** | Browser automation. Test UIs, screenshots, forms. | `claude mcp add playwright -s user -- npx -y @playwright/mcp@latest` |
| **PostgreSQL** | Direct DB access. Inspect schema, queries, debugging. | See MCP registry |

**Recommended setup order**: Memory → Context7 → Playwright → others as needed.

---

## ⚙️ Effort Levels & Fast Mode

**Effort Levels** control how deeply Claude thinks (Thinking Budget):
- `low` — quick answers, simple tasks
- `medium` — standard (default)
- `high` / `max` — maximum depth for complex architecture or debugging

Control via prompt: `"Think deeply about this"` or by setting `MAX_THINKING_TOKENS`.

**Fast Mode**: `/fast` toggles to the faster, cheaper model (`ANTHROPIC_SMALL_FAST_MODEL`).
Ideal for quick, iterative tasks. Toggle back with `/fast` again.

---

## 🖥️ Background Tasks & Verbose Output

- **`Ctrl+B`** — Moves a running task to the background. You can keep working while it executes.
  Ideal for: builds, test suites, long-running commands. Output is buffered — Claude retrieves it later.
  *(tmux users: press `Ctrl+B` twice)*
- **`Ctrl+O`** — Toggles verbose output. See exactly what tools are called, parameters, and output.
  Equivalent to the `--verbose` flag. Toggle off when it gets noisy.
- **`Ctrl+F`** — Kills all background agents.
- **`Ctrl+T`** — Toggles the task list view.

---

## 💰 Token Optimization Rules

1. **Be Specific** — Precise prompts = fewer iterations = less context = lower cost.
2. **Use /compact proactively** — Don't wait for context warnings. Compact after each sub-task.
3. **Right Model** — Use Haiku for boilerplate. Sonnet for features. Opus only for complex architecture.
4. **Limit MCP Servers** — Each server adds tool definitions to every request. Only enable what you need.
5. **Batch Operations** — Group related changes in one prompt instead of multiple small requests.
6. **Fresh Sessions** — Start new sessions for unrelated tasks instead of carrying stale context.
7. **One task per session** — Don't mix unrelated work. It pollutes context and wastes tokens.

**Token cost awareness** (Claude 4 Sonnet): Input $3/MTok, Output $15/MTok, Cached $0.30/MTok.
Use `/compact` and `/clear` as primary cost-saving tools.

---

## 🔌 n8n Integration Rules

> **CRITICAL**: Do NOT code business logic that n8n can handle visually.

| Task | Code It? | n8n It? |
| :--- | :--- | :--- |
| Payment webhook processing | ✅ API route | ❌ |
| Welcome emails | ❌ | ✅ |
| Slack/Discord notifications | ❌ | ✅ |
| Scheduled reports | ❌ | ✅ |
| Social media posting | ❌ | ✅ |
| Data enrichment | ❌ | ✅ |

**Pattern**: Build a webhook endpoint in your app → trigger n8n workflow → n8n handles the rest.

---

## 🔒 Security Checklist

- [ ] Database row-level security / access policies enabled
- [ ] API routes validate authentication
- [ ] Payment webhooks verified with signature checks
- [ ] Environment variables in `.env.local` (never committed)
- [ ] Security headers configured (CSP, etc.)
- [ ] Rate limiting on public API endpoints

---

## 🛡️ Trust Calibration

Not all code changes deserve the same level of scrutiny.

| Code Type | Review Level |
|-----------|-------------|
| **Boilerplate** (UI components, CRUD, config) | Auto-accept. Low risk. |
| **Business Logic** (pricing, permissions, flows) | Review carefully. Medium risk. |
| **Security** (auth, payments, RLS, secrets) | Line-by-line review. Never auto-accept. |

> 1.75× more logic errors in AI-generated code vs. manually written. 45% of AI-generated code contains potential vulnerabilities. Verify everything in the security tier.

---

## 🌿 Git Workflow

### Commit Strategy
- Commit after each **completed sub-task** — not after the whole feature.
- Use **conventional commits**: `feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:` — add to CLAUDE.md.
- Let Claude write commit messages: *"Commit this with a descriptive message"*.
- Always run `git stash` before starting a long session as a safety net.

### Branch Patterns
- Feature branches: one Claude session per branch.
- Use `--worktree` for parallel work on multiple branches.
- Claude can create PRs: *"Create a PR with a summary of changes"*.
- **Never let Claude push to `main`/`develop` directly.**

### Git Worktrees (Parallel Work)
Isolated Git copies in the same repo — each worktree has its own branch + context:
```bash
claude --worktree feature-auth    # or: claude -w feature-auth
```
Worktrees are created under `.claude/worktrees/`. Auto-cleanup when no changes are made.
For agent isolation: add `isolation: "worktree"` in agent frontmatter.

### Recovery
`git reflog` is your friend. Every state is recoverable. Teach Claude your branch conventions in CLAUDE.md.

---

## 🤖 Agents & Multi-Instance Workflows

### Configuration Decision Tree
- **CLAUDE.md** → Needed every session? (conventions, commands, rules)
- **Hook** → Should auto-trigger on events? (format, inject context, security gate)
- **MCP Server** → Needs external access? (DB, API, browser, docs)
- **Slash Command** → Repeatable workflow? (review, deploy, migrations)
- **Agent** → Needs isolated context? (code review, debug, architecture)
- **Skill** → Shared knowledge? (cross-project patterns, domain expertise)

### Multi-Instance Workflows
You are the main thread. Orchestrate 2–5 Claude instances on independent tasks:
- **Terminal 1**: Bug fixing (one branch)
- **Terminal 2**: New feature (separate branch/worktree)
- **Terminal 3**: Test expansion or docs
Works best when tasks touch **different files**. Use Git Worktrees to avoid conflicts.

### OpusPlan Mode
Opus for planning, Sonnet for execution — the best of both worlds:
```bash
/model opusplan   # Opus thinks & plans, Sonnet writes the code
```
**When to use**: Complex architecture decisions, multi-file refactorings, budget-conscious large tasks.
Cost savings: ~40–60% vs. pure Opus at comparable output quality.

### GSD Plugin (Context-Rot Prevention)
For large, multi-phase features that exceed a single session's context:
```bash
npx get-shit-done-cc@latest
```
GSD spawns specialized sub-agents with fresh 200K context per task. Atomic Git commits per task. Parallel wave execution. Use for: features from scratch, large refactors, architectural research.

---

## 🏛️ The 5 Pillars of Agentic Engineering

Based on John Kim (Meta Staff Engineer) — "Push To Prod"

| Pillar | Concept | Implementation |
|--------|---------|----------------|
| **1. Context** | Right information at the right time | CLAUDE.md + Skills + @file references + folder-level CLAUDE.md |
| **2. Validation** | Self-checking validation loops | Mandatory validation loop: test → lint → build → diff |
| **3. Friction** | Intentional blocks in the loop | Plan Mode + PreToolUse hooks + "Only implement if 100% sure" |
| **4. Codebases** | Optimize repos for agents | Explicit names, inline docs, clear boundaries, ADRs |
| **5. Compound** | Pillars multiply each other | Each improvement accelerates all others |

> Better context → fewer mistakes → fewer validation failures → faster iterations.
> The compound effect: teams that invest in all 5 pillars see exponential, not linear, productivity gains.

---

## 🔄 Context Management (Daily Workflow)

### Morning
1. Start with `/plan` — Review what needs to be done. Break into discrete tasks.
2. Check `walkthrough.md` for Night Mission outcomes.

### During Day
1. One task per session. Be specific.
2. Use `/compact` between sub-tasks — don't wait for context warnings.
3. Review every diff before accepting — Claude is capable but not infallible.

### End of Day
1. Update this CLAUDE.md with discoveries and new rules.
2. Note open issues.
3. Clean context for tomorrow.

---

## 📡 Headless & CI Mode

Claude Code without an interactive session — for scripts, CI/CD, and automation:

```bash
# Print mode — single query, no interactive terminal
claude -p "Review the last PR for security issues"

# Piped input — Unix pipeline integration
cat error.log | claude -p "Analyze this error"

# Structured output
claude -p "query" --output-format json

# Budget control — limit cost in automations
claude -p "query" --max-turns 5 --max-budget-usd 2.00

# GitHub Actions: @claude mention triggers automated review
# uses: anthropics/claude-code-action@beta
# trigger_phrase: "@claude"
```

---

## 📝 Compounding Memory

> This section grows over time. Every correction becomes a rule.
> Target size: 4–8 KB. For large files, use `@path/to/module.md` to import sub-files.

### Growth Milestones
- **Week 1**: ~5 rules — project name, commands, basic conventions.
- **Month 1**: ~20 rules — architecture patterns, naming conventions, test requirements.
- **Month 3**: ~50 rules — deep domain knowledge, edge cases, performance guidelines.

### Discovered Rules
<!-- Add rules here as you discover them. Format: YYYY-MM-DD: Rule -->
<!-- Example: 2024-01-15: Always use `createServerClient` not `createClient` for Supabase in Server Components -->

### Common Mistakes
<!-- Add recurring mistakes here so Claude avoids them -->
<!-- Example: Don't use `redirect()` in try/catch blocks — it throws an error by design -->
