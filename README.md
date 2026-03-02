# 🏭 Indie AI Factory

> **From idea to revenue in one template.** A GitHub template repository that combines **Antigravity** (Gemini) and **Claude Code** into a unified autonomous development workflow.

---

## 🚀 Quick Start

### 1. Create Your Project
Click **"Use this template"** on GitHub → Name your project → Clone it.

```bash
git clone --recurse-submodules git@github.com:YOUR_USER/your-project.git
cd your-project
npm install
```

### 2. Fill the Project Spec
Edit `docs/project-spec.md` — this is your project's "Bible". Be specific about:
- The problem you're solving
- Your target user
- MVP features (max 3)
- Revenue model

### 3. Launch the Night Mission
Open Antigravity and run:
```
/night-mission Build [your product description here]
```

### 4. Morning Check
When you wake up:
1. Read `walkthrough.md` — what was built
2. Run `npm run dev` — inspect the result
3. Open Claude Code for precision refinement

---

## 📁 Project Structure

```
.
├── .agent/                      # Antigravity config
│   ├── skills/                  # Git submodule → 621+ skills
│   └── workflows/
│       └── night-mission.md     # /night-mission workflow
├── .antigravity/                # Handoff zone (AG ↔ Claude Code)
│   ├── artifacts/               # Runtime: task_plan.md, findings.md
│   └── templates/               # Immutable templates
│       ├── task_plan_template.md
│       └── night_mission.md
├── .claude/                     # Claude Code Enterprise Engine
│   ├── agents/
│   │   ├── reviewer.md          # Security review agent
│   │   └── debugger.md          # Systematic debugging agent
│   ├── hooks/
│   │   └── post-edit.sh         # Auto-Prettier (zero-token)
│   ├── settings.json            # Hooks + permissions config
│   └── skills/                  # Domain-specific knowledge
├── docs/
│   └── project-spec.md          # The "Bible" of the project
├── src/                         # Application code
├── AGENTS.md                    # Skill Registry (Antigravity)
├── CLAUDE.md                    # Layer 2 Memory (Claude Code)
├── GEMINI.md                    # System Kernel v2.1 (Antigravity)
└── README.md                    # You are here
```

---

## 🔄 The Autonomous Workflow

### Step 1: Research (NotebookLM + n8n)
Use n8n to scrape Reddit/Trustpilot data → feed to NotebookLM → generate `project-spec.md`.

### Step 2: Strategic Planning (Antigravity Phase I)
Antigravity reads `project-spec.md` and creates an atomic `task_plan.md` using the template.
You review and approve in ~5 minutes.

### Step 3: Night Mission (Full Autonomy)
The agent works through Phases II-IV autonomously:
- **Phase II**: Architecture (Mermaid diagrams, DB schema, API contracts)
- **Phase III**: Implementation (TDD, iterative commits)
- **Phase IV**: Verification (tests, screenshots, "Wow-Factor" audit)
- **Healer Loop**: Self-correction on failures

### Step 4: Precision Refinement (Claude Code)
Morning fine-tuning in the terminal using the **WHAT/WHERE/HOW/VERIFY** pattern:
```
<WHAT> Integrate Stripe Checkout.
<WHERE> src/lib/stripe/checkout.ts
<HOW> Use skill stripe-api.md.
<VERIFY> npm run build && npm run test
```

---

## 🧰 Two AI Engines, One Factory

| Capability | Antigravity (Gemini) | Claude Code |
| :--- | :--- | :--- |
| **Best For** | Architecture, planning, full-stack builds | Precision edits, debugging, integrations |
| **Mode** | Autonomous (Night Mission) | Interactive (Terminal) |
| **Context** | Broad (sees full project) | Deep (focused on current file) |
| **Config** | `GEMINI.md` + `AGENTS.md` | `CLAUDE.md` + `.claude/` |

---

## ⚡ Pro Tips

### Zero-Token Hooks
`.claude/hooks/post-edit.sh` runs `prettier` automatically after every file edit. This saves Claude expensive formatting tokens and keeps code clean.

### Progressive Disclosure
Skills are loaded lazily: `view_file` on each skill BEFORE using it. This keeps context lean and the AI intelligent. Don't load all 621 skills!

### Context Management
In Claude Code, run `/compact` after each completed task to summarize history and prevent "Context Rot".

### n8n as Backend Turbo
Don't code business logic that n8n can handle visually:
- ✅ Code: Webhook endpoint, core app logic
- ✅ n8n: Emails, notifications, reports, social posts

---

## 🛡️ Quality Charter

Every project built with this template MUST include:

| Pillar | Requirement |
| :--- | :--- |
| **Research** | Comparative analysis before coding |
| **UX/UI** | Modern aesthetics (Tailwind v4, Framer Motion) |
| **Testing** | E2E (Playwright) + Unit (Vitest) |
| **Ops** | Deployment strategy (Vercel, Docker) |
| **Security** | OWASP check for every feature |

---

## 📋 Adding Skills

### Antigravity Skills
The 621+ skills library is included as a git submodule. Update it:
```bash
git submodule update --remote
```

### Claude Code Skills
Add domain-specific knowledge files to `.claude/skills/`:
```bash
echo "# Stripe API Patterns\n..." > .claude/skills/stripe-api.md
```

---

## 🏗️ Default Tech Stack

| Layer | Technology |
| :--- | :--- |
| Framework | Next.js 14 (App Router) |
| Language | TypeScript 5.x |
| Styling | Tailwind CSS v4 |
| Database | Supabase (Postgres + Auth) |
| Payments | Stripe |
| Automation | n8n (self-hosted) |
| Testing | Playwright + Vitest |
| Deployment | Vercel |

> Customize in `CLAUDE.md` for your specific project.

---

## 📄 License

MIT — Build what you want. Ship what matters.
