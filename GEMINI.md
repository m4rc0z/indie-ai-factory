# SYSTEM KERNEL v2.1: "Indie AI Factory"

> This file is the **process kernel**. It enforces **structure** and delegates **method** to the chosen Skill Bundle.

---

## 🛑 GLOBAL OVERRIDE

1. **3-Strike-Rule**: After 3 consecutive failures → STOP & Report.
2. **Auto-Save**: After every successful milestone → `git commit -m "milestone: <description>"`.
3. **Quality Charter**: For complex tasks, you MUST include:
   - **Research**: Comparative analysis before coding.
   - **UX/UI**: Modern aesthetics (Vite/Next.js, Tailwind v4, Framer Motion).
   - **Testing**: Automated E2E (Playwright) + Unit Tests.
   - **Ops**: Deployment strategy (Docker, CI/CD, Observability).
   - **Security**: OWASP check for every feature.
4. **No Half-Baked Code**: If it's not production-ready, it's not finished.

---

## 🧬 THE GENERIC LIFECYCLE (Skill-Driven)

### Phase I: Planning & Strategy (The "Brain")
*Goal: Define the strategy.*

1. **Skill Discovery**: Run `list_dir` on `.agent/skills/awesome-collection/skills` to discover available skills.
2. **Bundle Selection**: Analyze the request. Choose the perfect Skill Bundle from `AGENTS.md`.
3. **Skill-Check & Planning**:
   - Check `AGENTS.md` for available skills.
   - **LOAD the Planning Skill**: Use `view_file` on `.agent/skills/awesome-collection/skills/concise-planning/SKILL.md`.
   - **ACKNOWLEDGE**: Write in your response: "✅ Loaded `concise-planning`. Key rule: '[exact quote from SKILL.md]'."
   - Assign EACH phase (II, III, IV) a specific skill from the bundle.
   - **CRITICAL**: You are FORBIDDEN from using internal skills if project-local skills are available.
   - **CRITICAL**: You may NOT proceed without loading AND acknowledging the planning skill first.
4. **Output**: Create `task_plan.md` **using `.antigravity/templates/task_plan_template.md` strictly**.
5. **GATEWAY**: Wait for (implicit) approval.

### Phase II: Architecture & Design (The "Blueprint")
*Goal: Visualization & Structure.*

- **Action**: Execute the skill defined in the **`task_plan.md` Manifest**.
- **UX Requirement**: You MUST define the visual design system (Design Tokens, Palette, Motion) in `findings.md`.
- **Output**: A blueprint (diagram, document, or schema) + UX Design System.
- **GATEWAY**: The design must feel "Premium" before code is written.

### Phase III: Implementation (The "Build")
*Goal: Value Creation.*

- **Action**: Execute the developer skill defined in the **Manifest**.
- **TDD Rule**: Write tests BEFORE or during implementation. Never skip tests.
- **Guideline**: Follow the chosen skill's Best Practices strictly.
- **Rule**: Work iteratively. Commit frequently.
- **Legacy Purge**: On redesign/overhaul, **first** remove all old color/layout classes before building new components.

### Phase IV: Verification (The "Quality Check")
*Goal: Proof of Work.*

- **Action**: Execute the QA skill defined in the **Manifest**.
- **Vision Audit**: You MUST open the UI in the browser, take screenshots, and critically audit them for contrast, spacing, and "Wow-Factor".
- **Theme Inversion Check**: Explicitly verify that no root elements (body, main) still have old classes sabotaging the new design system.
- **Failure Hunting**: Assume your work is flawed. Actively search for 3 things that could be better (Contrast, Spacing, Micro-interactions).
- **DOD CHECK**: Verify against the **Quality Charter** (Research, UX, Testing, Ops, Security).
- **GATEWAY (Definition of Done)**: The task is only done when validation AND the vision audit pass ("PASS").

---

## 🔄 THE HEALER LOOP (Self-Correction)

1. **Validation Fail**: If Phase IV fails (test red, browser error).
2. **Auto-Revert**: Go immediately back to **Phase III**.
3. **Debug**: Use `systematic-debugging` from the Essentials Pack.
4. **Recursive Refinement**: Even if Phase IV passes, ask: "Can this be better?"
   - Check UX with `frontend-design`.
   - Check Security with `top-web-vulnerabilities`.
   - Check Performance with `web-performance-optimization`.
5. **Retry**: Fix the code and restart Phase IV.
   - *Prohibition*: Never give up after an error. You have infinite attempts (up to the 3-Strike limit per attempt).

---

## 🔌 SKILL LOADING PROTOCOL (Mandatory)

**BEFORE using ANY skill, you MUST:**
1. **READ**: Use `view_file` to read: `.agent/skills/awesome-collection/skills/[skill-name]/SKILL.md`.
2. **ACKNOWLEDGE**: Confirm: "✅ Loaded [skill-name]. Key rule: [quote from file]."
3. **EXECUTE**: Only THEN follow the steps from the file.

**FORBIDDEN ACTIONS:**
- ❌ Writing "I'll use [skill-name]" without calling `view_file` first.
- ❌ Claiming to follow a skill's instructions without reading the file.
- ❌ Inventing skill names that don't exist.

---

## ⚖️ SKILL GOVERNANCE

The agent is **bundle-authoritarian**.
- When you choose the "Security Pack", you act like an auditor (paranoid, strict).
- When you choose the "Game Dev Pack", you act like a game dev (iterative, visual).
- **Follow the rules of your chosen bundle.**
