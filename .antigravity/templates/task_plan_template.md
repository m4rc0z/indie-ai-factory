# Task Plan: [Title]

## 🧠 Phase I: Planning & Strategy
**Status**: [Thinking / Done]

### 1. The Skill Manifest (Dynamic Orchestration)
*Define the necessary steps for this specific mission and assign the best Skill.*

**RULE: BE ATOMIC.** Do not write "Build App". Break it down: "Setup Repo", "Design Schema", "Auth Logic", "UI Shell".
**RULE: UNLIMITED ROWS.** The table below is a starting point. Add as many rows as needed. A complex task should have 10-15 steps.
Each step should ideally be 1-3 tool calls. High Resolution = High Success.
**RULE: VALIDATE SKILLS.** Only use skills from `.agent/skills/awesome-collection/skills/` (see AGENTS.md Registry). Do NOT invent names.

| Step | Action Description | Selected Skill | Why this Skill? | Key Rule (from SKILL.md) |
| :--- | :--- | :--- | :--- | :--- |
| **1** | **Strategy & Plan** | `concise-planning` | Core Planning Skill | Start with checklist. |
| **2** | [e.g. Research] | `[e.g. autonomous-researcher]` | [Why not manual?] | [Quote from SKILL.md] |
| **3** | [e.g. Design] | `[e.g. mermaid-expert]` | [Why this over X?] | [Quote from SKILL.md] |
| **4** | [e.g. Build] | `[e.g. react-patterns]` | [Why this stack?] | [Quote from SKILL.md] |
| **5** | [e.g. Test] | `[e.g. playwright-skill]` | [Why E2E?] | [Quote from SKILL.md] |
| **6** | ... | ... | ... | ... |

### 2. Research & Findings
*What did we learn from initial research?*
- **Context**: ...
- **Technical Constraints**: ...
- **Competitive Benchmarking**: (e.g. How do pros solve this?)

### 3. Quality Strategy (The "Charter")
*How do we ensure this is production-ready?*
- **UX/Aesthetics**: (e.g. Palette, Motion, Typography)
- **Testing**: (e.g. Unit tests for X, E2E for Y)
- **Ops/Security**: (e.g. Docker, OWASP check)

### 4. Step-by-Step Execution Plan
*Breakdown into Phase II, III, IV*

#### Phase II: Architecture
- [ ] Create Mermaid Diagram
- [ ] Define API Schema
- [ ] Visual Design Tokens (findings.md)

#### Phase III: Implementation (TDD)
- [ ] Setup Tests
- [ ] Core Logic
- [ ] Polish & UX Fine-tuning

#### Phase IV: Verification
- [ ] Automated Test Run
- [ ] Visual Contrast Check (WCAG 4.5:1)
- [ ] Screenshot Audit (Desktop & Mobile)
- [ ] DoD Check: [ ] Research [ ] UX [ ] Testing [ ] Ops [ ] Security
- [ ] Manual Proof Recording (Artifact include)

#### Phase V: Recursive Refinement
- [ ] Cross-Skill Audit (UX, Security, Performance)
- [ ] Vision-Driven Polishing (Screenshot-based)
- [ ] Final "Wow-Factor" Check
