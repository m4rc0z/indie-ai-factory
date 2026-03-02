#!/bin/bash
# PreToolUse Hook: Check for secrets in commands
# Blocks Bash commands that might leak secrets.
# Runs before Claude executes any shell command — zero tokens consumed.

set -euo pipefail

COMMAND="$1"

# Check for common secret patterns
if echo "$COMMAND" | grep -qiE '(api_key|secret|password|token|private_key)='; then
  echo "⛔ BLOCKED: Command appears to contain a secret value."
  echo "Use environment variables instead of inline secrets."
  exit 1
fi

# Check for piping remote scripts to shell
if echo "$COMMAND" | grep -qiE 'curl.*\|.*bash|wget.*\|.*sh'; then
  echo "⛔ BLOCKED: Piping remote scripts to shell is not allowed."
  exit 1
fi

exit 0
