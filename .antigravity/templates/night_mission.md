# 🌙 Night Mission Activation Template

## Pre-Flight Checklist

Before activating the Night Mission, ensure:
- [ ] `docs/project-spec.md` is filled with the project specification
- [ ] `AGENTS.md` has the correct skill bundles selected
- [ ] `CLAUDE.md` reflects the correct tech stack
- [ ] Git is clean (`git status` shows no uncommitted changes)
- [ ] Artifact review policy is set to "Always Proceed"

---

## Activation Command

```
/night-mission [YOUR OBJECTIVE HERE]
```

**Example**:
```
/night-mission Build a meal prep SaaS with weekly generation, recipe swaps, and Stripe subscriptions.
```

---

## What Happens Overnight

1. **Phase I (Planning)**: Agent reads `project-spec.md`, creates `task_plan.md` using the template.
2. **Phase II (Architecture)**: Agent creates Mermaid diagrams, DB schema, API contracts.
3. **Phase III (Build)**: Agent implements TDD-style, commits after each milestone.
4. **Phase IV (Verification)**: Agent runs tests, takes screenshots, audits for "Wow-Factor".
5. **Healer Loop**: If tests fail → auto-revert to Phase III → fix → retry Phase IV.

---

## Morning Check

When you wake up:

1. **Read `walkthrough.md`** — Summary of what was built overnight.
2. **Read `findings.md`** — Research findings and design decisions.
3. **Check `git log`** — Verify milestone commits.
4. **Run the app** — `npm run dev` and inspect in browser.
5. **Handoff to Claude Code** — Use the WHAT/WHERE/HOW/VERIFY pattern for fine-tuning.

---

## Healer Loop Rules

```
IF Phase IV fails:
  → Auto-revert to Phase III
  → Use `systematic-debugging` skill
  → Fix the issue
  → Retry Phase IV
  → Max 3 strikes per issue
  → Cross-check with `top-web-vulnerabilities` on fixes
```

---

## Pro Tips

- **Context Management**: Break complex features into separate night missions.
- **Warm Handoff**: Leave a `TODO.md` with specific instructions for the agent.
- **Scope Lock**: Be specific. "Build auth" is too vague. "Build email/password auth with Supabase, protected dashboard route, and logout button" is perfect.
