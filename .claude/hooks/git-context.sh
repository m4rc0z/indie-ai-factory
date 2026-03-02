#!/bin/bash
# UserPromptSubmit Hook: Inject git context
# Auto-injects branch name, recent commits, and status into every prompt.
# This gives Claude awareness of the current git state — zero tokens cost for the hook itself.

set -euo pipefail

BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
RECENT_COMMITS=$(git log --oneline -3 2>/dev/null || echo "no commits")
STATUS=$(git status --short 2>/dev/null | head -10 || echo "unknown")

cat << EOF
[Git Context]
Branch: $BRANCH
Recent commits:
$RECENT_COMMITS
Uncommitted changes:
$STATUS
EOF
