---
description: Five Whys root cause analysis for any bug, incident, or recurring problem
---

Perform a Five Whys root cause analysis on: $ARGUMENTS

## Process

Ask "Why?" five times in sequence, going deeper with each answer, until you reach the systemic root cause.

**Template:**
- **Problem**: [State the problem clearly]
- **Why 1**: [First cause]
  - Why? → [Answer]
- **Why 2**: [Second cause]
  - Why? → [Answer]
- **Why 3**: [Third cause]
  - Why? → [Answer]
- **Why 4**: [Fourth cause]
  - Why? → [Answer]
- **Why 5**: [Root cause — the systemic issue]

## Output

After the analysis, provide:
1. **Root Cause**: One sentence summary of the systemic issue
2. **Contributing Factors**: 2-3 factors that made this possible
3. **Fix**: What needs to change in the code
4. **Prevention**: What process or tool change prevents recurrence (e.g., test, lint rule, CLAUDE.md rule)

> Combine with `/review` for full post-incident analysis.
