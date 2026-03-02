# CLAUDE.md — Layer 2 Memory

> This file is automatically loaded by Claude Code on every session.
> It defines the project's tech stack, coding standards, and integration rules.

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
  // Validate, then forward to n8n
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

## 📋 Prompt Pattern: WHAT / WHERE / HOW / VERIFY

Use this pattern for every Claude Code task:

```
<WHAT> Implement Stripe checkout session creation.
<WHERE> src/lib/stripe/checkout.ts
<HOW> Use skill stripe-api.md. Follow the Stripe Checkout guide.
<VERIFY> npm run build && npm run test
```

---

## 🧹 Context Management

After completing each task from `task_plan.md`:
1. Run `/compact` to summarize and free context.
2. Verify the summary captures key decisions.
3. Continue to the next task with a fresh context.
