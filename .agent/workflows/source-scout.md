---
description: Takes an idea and finds the exact sources to load into NotebookLM
---

# /source-scout [YOUR IDEA]

This workflow bridges Phase 0 (Ideation) and Phase 1 (Deep Dive). Given a specific product idea, it autonomously researches the web to produce a concrete "Source Shopping List" for NotebookLM.

## When to use
- You already have an idea (either from Phase 0 or from your own brainstorming).
- You need to know WHAT to put into NotebookLM before the Researcher Agent can grill it.

## Antigravity Execution Steps

1. **Parse the Idea:** Understand the user's product idea, target customer, and niche.

2. **Competitor Discovery (Brave Search):**
   Use `search_web` or `browser_subagent` navigating to **search.brave.com** to find:
   - The top 3-5 existing competitors or similar tools
   - Their exact website URLs (homepage + pricing page)
   - Alternative/comparison pages (e.g., G2, Capterra, AlternativeTo)

3. **Pain Point Discovery (Brave Search):**
   Search for real user complaints:
   - `site:reddit.com "[Competitor Name] alternative"` or `site:reddit.com "[niche] software sucks"`
   - German forums if applicable: `site:haustechnikdialog.de`, `site:chefkoch.de/forum`, etc.
   - Save the exact URLs of the most relevant threads (minimum 3)

4. **Market Data Discovery:**
   Search for:
   - Industry reports or blog posts about market size
   - Recent news articles about the niche
   - Pricing benchmarks

5. **Write the Source Shopping List:**
   Write the output to `docs/source-shopping-list.md` in this exact format:

   ```markdown
   # Source Shopping List for NotebookLM

   **Idea:** [User's idea in one sentence]
   **Date:** [YYYY-MM-DD]

   ---

   ## How to Use This List
   1. Open [NotebookLM](https://notebooklm.google.com/) → Create new notebook
   2. For each source below, click "Add Source" in NotebookLM
   3. For URLs: paste them directly (NotebookLM can import web pages)
   4. For PDFs: open the URL in your browser, CMD+P → Save as PDF, then upload
   5. For Keywords: use NotebookLM's "Search" source feature with these exact terms

   ---

   ## Competitors (Add these as sources)

   | # | Competitor | What to Add | URL |
   |---|-----------|-------------|-----|
   | 1 | [Name] | Homepage + Pricing Page | [URL] |
   | 2 | [Name] | Homepage + Pricing Page | [URL] |
   | 3 | [Name] | Homepage + Pricing Page | [URL] |

   ## User Complaints (Add these as sources)

   | # | Source | Why it matters | URL |
   |---|--------|---------------|-----|
   | 1 | Reddit thread: "[title]" | [Users complain about X] | [URL] |
   | 2 | Forum post: "[title]" | [Users want Y but can't find it] | [URL] |
   | 3 | Reddit thread: "[title]" | [Pain point Z] | [URL] |

   ## Market Data (Add these as sources)

   | # | Source | What you'll learn | URL |
   |---|--------|------------------|-----|
   | 1 | [Blog/Report title] | Market size / trends | [URL] |
   | 2 | [G2 Category page] | Feature comparisons | [URL] |

   ## Keywords for NotebookLM Search
   Use these keywords in NotebookLM's built-in source search:
   - "[keyword 1]"
   - "[keyword 2]"
   - "[keyword 3]"

   ---

   ## After Loading Sources
   Once all sources are loaded in NotebookLM, share the notebook:
   **Share → "Anyone with link" → Copy link**

   Then run Phase 1 (The Deep Dive):
   ```
   /research "[Your idea]" "[Your NotebookLM link]"
   ```
   ```

6. **Notify the user** with the shopping list and instruct them to load the sources into NotebookLM.

## Constraints
- ❌ Do NOT generate vague suggestions like "search for competitors". Give EXACT URLs.
- ❌ Do NOT skip the Reddit/forum step. Real complaints are gold.
- ✅ DO verify that URLs are real and accessible before listing them.
- ✅ DO prioritize sources that contain pricing data and user complaints.
