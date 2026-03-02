# CLAUDE.md — Layer 1: Persistent Memory

> This file is automatically loaded by Claude Code on every session.
> It defines the project's tech stack, coding standards, and operational rules.
> **Rule**: Only add new rules when Claude makes the same mistake twice. No premature rules.

---

## 🏗️ Tech Stack

| Layer | Technology | Version |
| :--- | :--- | :--- |
| **Framework** | Next.js (App Router) | 14+ |
| **Language** | TypeScript | 5.x |
| **Styling** | Tailwind CSS | v4 |
| **Backend/DB** | Supabase (Postgres + Auth + Storage) | Latest |
| **Payments** | Stripe (Checkout + Webhooks) | Latest |
| **Automation** | n8n (Webhooks only) | Self-hosted |
| **Testing** | Playwright (E2E) + Vitest (Unit) | Latest |
| **Deployment** | Vercel | Latest |

## 📋 Commands

```bash
# Development
npm run dev          # Start dev server (Next.js)
npm run build        # Production build
npm run start        # Start production server

# Testing
npm run test         # Run unit tests (Vitest)
npm run test:watch   # Watch mode
npm run test:e2e     # Run E2E tests (Playwright)

# Quality
npm run lint         # ESLint
npm run format       # Prettier --write
npm run format:check # Prettier --check
```

---

## 📐 Coding Standards

### File Naming
- Components: `PascalCase.tsx` (e.g., `PricingCard.tsx`)
- Utilities: `camelCase.ts` (e.g., `formatDate.ts`)
- API Routes: `route.ts` in nested folder (e.g., `app/api/webhooks/stripe/route.ts`)
- Types: `types.ts` co-located with feature

### Architecture
```
src/
├── app/              # Next.js App Router pages
│   ├── (auth)/       # Auth-related routes
│   ├── (dashboard)/  # Protected routes
│   ├── api/          # API routes
│   └── layout.tsx    # Root layout
├── components/       # Shared UI components
│   ├── ui/           # Primitives (Button, Input, Card)
│   └── features/     # Feature-specific components
├── lib/              # Business logic & utilities
│   ├── supabase/     # Supabase client & helpers
│   ├── stripe/       # Stripe integration
│   └── utils/        # Generic utilities
├── hooks/            # Custom React hooks
└── types/            # TypeScript type definitions
```

### Code Rules
1. **Server Components by default** — Use `'use client'` only when needed.
2. **No `any` types** — Use `unknown` and type guards instead.
3. **Error boundaries** — Every page gets an `error.tsx`.
4. **Loading states** — Every page gets a `loading.tsx`.
5. **Zod validation** — All API inputs validated with Zod.

---

## 🎯 Prompting Pattern: WHAT / WHERE / HOW / VERIFY

Use this pattern for every Claude Code task:

| Part | Purpose | Example |
| :--- | :--- | :--- |
| **WHAT** | What needs to happen | "Implement Stripe checkout session creation" |
| **WHERE** | Which files/modules | "src/lib/stripe/checkout.ts" |
| **HOW** | Constraints, conventions | "Use skill stripe-api.md. Follow Stripe Checkout guide." |
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
1. Keep `npm run test` fast. Split slow tests into a separate suite.
2. Use `vitest` (fast) over `jest` (slow) for unit tests.
3. Run only affected tests during development: `vitest --reporter=dot --run path/to/file.test.ts`

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
| Stripe webhook processing | ✅ `route.ts` | ❌ |
| Welcome emails | ❌ | ✅ |
| Slack/Discord notifications | ❌ | ✅ |
| Scheduled reports | ❌ | ✅ |
| Social media posting | ❌ | ✅ |
| Data enrichment | ❌ | ✅ |

**Pattern**: Build a webhook endpoint in your app → trigger n8n workflow → n8n handles the rest.

```typescript
// src/app/api/webhooks/n8n/route.ts
export async function POST(req: Request) {
  const payload = await req.json();
  await fetch(process.env.N8N_WEBHOOK_URL!, {
    method: 'POST',
    body: JSON.stringify(payload),
  });
  return Response.json({ ok: true });
}
```

---

## 🔒 Security Checklist

- [ ] Supabase RLS enabled on ALL tables
- [ ] API routes validate auth via `getUser()`
- [ ] Stripe webhooks verified with `constructEvent()`
- [ ] Environment variables in `.env.local` (never committed)
- [ ] CSP headers configured in `next.config.js`
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
