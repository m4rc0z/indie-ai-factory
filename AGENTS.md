# Agent Standard Operating Procedures (SOP)

## The "Night Mission" Swarm Structure

The Master Agent dynamically switches "Personas" based on the Phase defined in `GEMINI.md`.

| Phase | Persona ("The Hat") | Primary Responsibility | Essential Skills / Tools |
| :--- | :--- | :--- | :--- |
| **I** | **Product Manager** | Requirements Engineering, Planning, De-Risking. | `concise-planning`, `product-manager-toolkit`, `atomic-planner` |
| **II** | **System Architect** | Visual Blueprints, Schema Design, API Contracts. | `mermaid-expert`, `sql-pro`, `database-design` |
| **III** | **Senior Engineer** | TDD Implementation, Refactoring, Git Hygiene. | `git-advanced-workflows`, `tdd-workflow`, `senior-fullstack` |
| **IV** | **QA Engineer** | E2E Testing, Browser Verification, "Healer" Loop. | `playwright-skill`, `systematic-debugging` |

---

## 📂 Installed Skills (Canonical Registry)

**Location**: `.agent/skills/awesome-collection/skills/` (621+ Skills)

**RULE**: You may ONLY use skills from this directory. Do NOT invent skill names.

**LOADING PROTOCOL**: Before using a skill, you MUST:
1. Use `view_file` to read `.agent/skills/awesome-collection/skills/[skill-name]/SKILL.md`.
2. Quote a rule from the file in your plan to prove you read it.
3. Follow the instructions in the file strictly.

---

## 🧰 Dynamic Skill Bundles

### 🚀 Essentials Starter Pack (Always Install)
- `concise-planning` — Always start with a plan.
- `lint-and-validate` — Keep code clean automatically.
- `git-pushing` — Save work safely.
- `kaizen` — Continuous improvement mindset.
- `systematic-debugging` — Debug like a pro.

### 🦄 Startup Founder Pack (Idea → Revenue)
- `product-manager-toolkit` — RICE prioritization, PRD templates.
- `competitive-landscape` — Competitor analysis.
- `launch-strategy` — Product launch planning.
- `copywriting` — Marketing copy that converts.
- `stripe-integration` — Get paid from day one.
- `micro-saas-launcher` — Micro-SaaS patterns.

### 🌐 Web Wizard Pack (Frontend)
- `frontend-design` — UI guidelines and aesthetics.
- `react-best-practices` — React & Next.js optimization.
- `nextjs-best-practices` — Next.js App Router patterns.
- `tailwind-patterns` — Tailwind CSS v4 styling.
- `ui-ux-pro-max` — Premium design systems and tokens.

### ⚡ Full-Stack Developer Pack
- `senior-fullstack` — Complete fullstack development guide.
- `frontend-developer` — React 19+ and Next.js 15+ expertise.
- `backend-dev-guidelines` — Node.js/Express/TypeScript patterns.
- `api-patterns` — REST vs GraphQL vs tRPC selection.
- `database-design` — Schema design and ORM selection.
- `stripe-integration` — Payments and subscriptions.

### 🛡️ Security Developer Pack
- `api-security-best-practices` — Secure API design patterns.
- `auth-implementation-patterns` — JWT, OAuth2, session management.
- `backend-security-coder` — Secure backend coding.
- `frontend-security-coder` — XSS prevention and client-side security.
- `top-web-vulnerabilities` — OWASP-aligned vulnerability taxonomy.

### 🐞 QA & Testing Pack
- `test-driven-development` — Red, Green, Refactor.
- `systematic-debugging` — Debug like Sherlock Holmes.
- `playwright-skill` — End-to-end testing with Playwright.
- `e2e-testing-patterns` — Reliable E2E test suites.
- `code-review-checklist` — Catch bugs in PRs.

### 📈 Marketing & Growth Pack
- `content-creator` — SEO-optimized marketing content.
- `seo-audit` — Technical SEO health checks.
- `analytics-tracking` — Set up GA4/PostHog correctly.
- `ab-test-setup` — Validated learning experiments.
- `email-sequence` — Automated email campaigns.
- `launch-strategy` — Product launch planning.

### 🌧️ DevOps & Cloud Pack
- `docker-expert` — Master containers and multi-stage builds.
- `aws-serverless` — Serverless on AWS.
- `terraform-specialist` — Infrastructure as Code mastery.
- `deployment-procedures` — Safe rollout strategies.

---

## 🧩 Recommended Bundle Combos

| Goal | Bundles |
| :--- | :--- |
| **Ship a SaaS MVP (2 weeks)** | Essentials + Full-Stack + QA + Startup Founder |
| **Harden existing app** | Essentials + Security + DevOps + QA |
| **Build an AI product** | Essentials + Full-Stack + Agent Architect |
| **Grow traffic & conversions** | Web Wizard + Marketing & Growth |

---

## 📚 How to Use Bundles

1. **Pick by immediate goal** — Need to ship? Use Essentials + one domain pack.
2. **Start with 3-5 skills, not 20** — Expand only when you hit a real gap.
3. **Invoke consistently** — Load each skill via `view_file` before using it.
4. **Build a personal shortlist** — Reuse high-frequency skills to reduce context switching.
