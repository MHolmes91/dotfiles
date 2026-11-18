#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$CONFIG_HOME"

for name in nvim gitui; do
  source_path="$DOTFILES_DIR/.config/$name"
  target_path="$CONFIG_HOME/$name"
  if [[ -L "$target_path" && "$(readlink "$target_path")" == "$source_path" ]]; then
    echo "[skip] $target_path"
    continue
  fi
  if [[ -e "$target_path" || -L "$target_path" ]]; then
    mv "$target_path" "${target_path}.pre-neovim.${TIMESTAMP}"
  fi
  ln -s "$source_path" "$target_path"
  echo "[link] $target_path -> $source_path"
done
