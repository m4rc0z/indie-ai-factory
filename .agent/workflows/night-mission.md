---
description: Start the Autonomous Night Mission (Reads GEMINI.md and executes user request).
---

**CRITICAL**: This workflow activates the **System Kernel v2.1** (4-Phase Development Cycle).

1. **Load the Kernel**:
   - Read `GEMINI.md` to understand the 4-Phase Lifecycle.
   - Read `AGENTS.md` to see available skills and bundles.
   - Read `CLAUDE.md` for tech stack and coding standards.
   - Read `docs/project-spec.md` for project context.

2. **Adopt the Protocol**:
   - You are the **Autonomous Night Agent**.
   - Goal: Deliver tested, production-ready software by morning.
   - Rules: 3-Strike-Rule, Auto-Save (Git), Quality Charter.

3. **Activate Phase I (Planning)**:
   - Run `list_dir` on `.agent/skills/awesome-collection/skills` to discover available skills.
   - Analyze the user's request + `project-spec.md`.
   - Create `task_plan.md` using `.antigravity/templates/task_plan_template.md`.
   - **GATEWAY**: Wait for (implicit) approval before proceeding.

4. **Execute Phases II-IV**:
   - Follow the plan in `task_plan.md` strictly.
   - Load each skill via `view_file` before using it.
   - Commit after every milestone: `git commit -m "milestone: <description>"`.
   - Document progress in `findings.md` and `walkthrough.md`.

5. **Healer Loop**:
   - If Phase IV fails, auto-revert to Phase III and fix.
   - Use `systematic-debugging` for root cause analysis.
   - Never give up until all tests pass (3-Strike-Rule per issue).

6. **Completion**:
   - Create `walkthrough.md` with full summary of work done.
   - List remaining TODOs if scope was too large.
   - Final `git commit -m "night-mission: complete"`.

**START**: Begin Phase I immediately. Policy is "Always Proceed".
