#!/usr/bin/env bash
set -euo pipefail

# Use the caller's active Node runtime (mise, asdf, or system Node).
if ! command -v pi >/dev/null 2>&1; then
  if ! command -v npm >/dev/null 2>&1; then
    echo "Node.js/npm required. Activate your preferred runtime first." >&2
    exit 1
  fi
  npm install -g @earendil-works/pi-coding-agent
fi

# Pi merges this personal package declaration into its existing settings;
# credentials, model choices, and other packages remain machine-local.
pi install npm:pi-vim

echo "Pi + Vim editing installed. Run /reload in existing Pi sessions."
