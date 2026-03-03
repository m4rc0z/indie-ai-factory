---
description: Discover unsexy B2B SaaS ideas without wasting Claude tokens
---

# /ideation [YOUR SKILLS/INTERESTS]

This workflow is entirely executed by Antigravity using its built-in browser subagent and web search capabilities. It is the recommended way to perform Phase 0: Ideation, as it saves your Claude Code tokens.

## Objective
Find profitable, unsexy B2B problems that fit a solo developer, explicitly avoiding saturated, generic AI wrappers.

## Antigravity Execution Steps

1. **Analyze User Input:** Review the skills and interests the user provided in their prompt.
2. **Launch Browser Subagent:** Use the `browser_subagent` tool to autonomously scour the web for complaints:
   - Search Reddit using `site:reddit.com "I hate having to manually" + [User's Interest / Niche]`.
   - Look into forums or platforms used by traditional, slow-to-adopt industries (e.g., local gyms, construction, dental).
3. **Filter and Synthesize:** 
   Cross-reference the user's skills with the discovered pain points to evaluate:
   - *Pain Level:* Is it a "bleeding neck" problem that costs real money?
   - *Feasibility:* Can the user build an MVP of this in 2-4 weeks?
   - *Distribution:* How easily can we reach these specific customers?
4. **Output Generation:** 
   Generate a markdown response presenting exactly 3 highly specific, actionable ideas formatted as follows:

   ```markdown
   ### Idea 1: [Catchy Name] - [One Sentence Pitch]
   *The "Unsexy" Pain Point:* [Describe the exact manual, painful process]
   *The MVP Solution:* [What is the absolute bare minimum software needed?]
   *Why it works for a Solo Dev:* [Explanation of low complexity and distribution]

   **Next Step for Research:**
   Search for these exactly to feed into NotebookLM (Phase 1): 
   - `site:reddit.com/r/[niche] [keyword]`
   ```

## Constraints for Antigravity
- ❌ Do NOT pitch generic AI wrappers (e.g., "AI copywriting tool").
- ❌ Do NOT pitch consumer social networks or two-sided marketplaces.
- ✅ DO pitch "Boring SaaS" (B2B tools that save time or make money).
