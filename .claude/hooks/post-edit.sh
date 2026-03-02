#!/bin/bash
# Post-Edit Hook: Auto-Prettier
# Runs prettier on any file Claude Code saves.
# This saves Claude expensive "formatting tokens".
#
# Supported file types: .ts, .tsx, .js, .jsx, .json, .css, .md, .html
#
# Usage: Called automatically by Claude Code via settings.json hook config.

set -euo pipefail

FILE="$1"

# Only process supported extensions
case "$FILE" in
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css|*.md|*.html)
    # Check if prettier is available
    if command -v npx &> /dev/null; then
      npx prettier --write "$FILE" 2>/dev/null || true
    fi
    ;;
  *)
    # Skip unsupported file types silently
    ;;
esac
