# CLAUDE.md — Layer 1: Persistent Memory

> This file is automatically loaded by Claude Code on every session.
> It defines project-agnostic coding standards, operational rules, and the tech selection process.
> **Rule**: Only add new rules when Claude makes the same mistake twice. No premature rules.

---

## 🏗️ Tech Stack

> **This section is populated by the Architect Agent in Phase 4.**
> The template ships stack-agnostic. The `/agent architect` chooses the optimal technologies
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

### Code Rules
1. **Server-first by default** — Minimize client-side JavaScript.
2. **No `any` types** — Use `unknown` and type guards instead.
3. **Error handling** — Every page/route needs proper error boundaries.
4. **Loading states** — Every data-fetching page needs loading feedback.
5. **Input validation** — All API inputs validated (Zod, Valibot, or equivalent).

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

## 💰 Token Optimization Rules

1. **Be Specific** — Precise prompts = fewer iterations = less context = lower cost.
2. **Use /compact proactively** — Don't wait for context warnings. Compact after each sub-task.
3. **Right Model** — Use Haiku for boilerplate. Sonnet for features. Opus only for complex architecture.
4. **Limit MCP Servers** — Each server adds tool definitions to every request. Only enable what you need.
5. **Batch Operations** — Group related changes in one prompt instead of multiple small requests.
6. **Fresh Sessions** — Start new sessions for unrelated tasks instead of carrying stale context.
7. **One task per session** — Don't mix unrelated work. It pollutes context and wastes tokens.

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

## 📝 Compounding Memory

> This section grows over time. Every correction becomes a rule.

### Discovered Rules
<!-- Add rules here as you discover them. Format: YYYY-MM-DD: Rule -->
<!-- Example: 2024-01-15: Always use `createServerClient` not `createClient` for Supabase in Server Components -->

### Common Mistakes
<!-- Add recurring mistakes here so Claude avoids them -->
<!-- Example: Don't use `redirect()` in try/catch blocks — it throws an error by design -->
