---
description: 6-perspective code review on the current diff or specified files
---

Review $ARGUMENTS (or the last `git diff` if no argument given) from 6 perspectives.

## The 6 Lenses

### 1. 🧑‍💼 Product Manager
- Does this change deliver the intended business value?
- Are there any user-facing regressions or confusing UX changes?
- Is the scope appropriate — too big? too small?

### 2. 👩‍💻 Developer
- Code quality: readability, maintainability, naming, DRY
- Performance: unnecessary re-renders, N+1 queries, blocking calls
- Edge cases: null checks, error handling, unexpected input
- TypeScript: proper types, no `any`, valid generics

### 3. 🧪 Quality Engineer
- Test coverage: are critical paths tested?
- Are edge cases and error scenarios covered?
- Any regression risk for existing functionality?
- Missing integration or E2E tests?

### 4. 🔐 Security Engineer (OWASP Top 10)
- Injection: SQL, command, XSS, path traversal
- Auth: missing auth checks, privilege escalation, insecure direct object refs
- Data exposure: secrets in code, logging PII, unencrypted sensitive data
- Input validation: unvalidated user input passed to DB or shell

### 5. 🚀 DevOps
- Environment variables: hardcoded secrets or config?
- Database migrations: reversible? tested?
- CI/CD impact: does this break existing pipelines?
- Observability: proper logging and error tracking in place?

### 6. 🎨 UX Designer
- Visual consistency with design system
- Accessibility: aria labels, keyboard navigation, color contrast
- Interaction design: loading states, error states, empty states

---

**Core principle**: "The future is now" — flag all issues. Prioritize as:
- 🔴 **Critical** — Must fix before merge
- 🟡 **Warning** — Should fix soon
- 🟢 **Info** — Nice to have / style suggestion
