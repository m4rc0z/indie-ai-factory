---
description: Discover unsexy B2B SaaS ideas without wasting Claude tokens
---

# /ideation [YOUR SKILLS/INTERESTS]

This workflow is entirely executed by Antigravity using its built-in browser subagent and web search capabilities. It is the recommended way to perform Phase 0: Ideation, as it saves your Claude Code tokens.

## Objective
Find profitable, unsexy B2B problems that fit a solo developer, explicitly avoiding saturated, generic AI wrappers.

## Antigravity Execution Steps

1. **Analyze User Input:** Review the skills and interests the user provided in their prompt.
2. **Launch Web Search / Browser:** Use the `search_web` tool, or launch the `browser_subagent` explicitly navigating to **search.brave.com**, to autonomously scour the web for complaints:
   - Search Brave for Reddit threads using `site:reddit.com "I hate having to manually" + [User's Interest / Niche]`.
   - Look into forums or platforms used by traditional, slow-to-adopt industries (e.g., local gyms, construction, dental).
   - If using the browser subagent, ensure it actively clicks into forum threads to read real user pain points.
3. **Filter and Synthesize:** 
   Cross-reference the user's skills with the discovered pain points to evaluate:
   - *Pain Level:* Is it a "bleeding neck" problem that costs real money?
   - *Feasibility:* Can the user build an MVP of this in 2-4 weeks?
   - *Distribution:* How easily can we reach these specific customers?
4. **Output Generation:** 
   Write the output to `docs/ideation-results.md` in the project root, presenting exactly 3 highly specific, actionable ideas formatted as follows:

   ```markdown
   # Ideation Results

   **Date:** [YYYY-MM-DD]
   **User Profile:** [Skills & interests provided]
   **Search Method:** Brave Search (search.brave.com)

   ---

   ### Idea 1: [Catchy Name] - [One Sentence Pitch]
   *The "Unsexy" Pain Point:* [Describe the exact manual, painful process]
   *The MVP Solution:* [What is the absolute bare minimum software needed?]
   *Why it works for a Solo Dev:* [Explanation of low complexity and distribution]

   **Research Queries for Phase 1 (NotebookLM):**
   Run these searches and save the results as PDFs to upload into NotebookLM:
   - `site:reddit.com/r/[niche] [keyword]`
   - `[Competitor Name] pricing page` (save as PDF)
   - `[G2 category link]`

   ---
   [Repeat for Idea 2 and 3]
   ```

5. **Notify the user** with a summary of the 3 ideas and ask them to pick ONE to move to Phase 1 (The Deep Dive).

## Constraints for Antigravity
- ❌ Do NOT pitch generic AI wrappers (e.g., "AI copywriting tool").
- ❌ Do NOT pitch consumer social networks or two-sided marketplaces.
- ✅ DO pitch "Boring SaaS" (B2B tools that save time or make money).
- ✅ DO provide exact search queries the user can use to gather PDFs for NotebookLM.

