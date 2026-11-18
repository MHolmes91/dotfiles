#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"

if ! command -v agent-manager >/dev/null 2>&1; then
  echo "Install agent-manager first: https://github.com/wainmann/agent-manager#install" >&2
  exit 1
fi

mkdir -p "$HOME/.local/bin"
source_path="$DOTFILES_DIR/bin/nvim-cd"
target_path="$HOME/.local/bin/nvim-cd"
if [[ ! -L "$target_path" || "$(readlink "$target_path")" != "$source_path" ]]; then
  if [[ -e "$target_path" || -L "$target_path" ]]; then
    mv "$target_path" "${target_path}.pre-agent-manager.${TIMESTAMP}"
  fi
  ln -s "$source_path" "$target_path"
fi

# Current releases store settings in state.db. Import only our explicit
# preferences, preserving sessions and all unrelated user settings.
agent-manager import --settings "$DOTFILES_DIR/.config/agent-manager/settings.json"
echo "Agent Manager configured: Pi default, nvim-cd editor (Ctrl+N)."
