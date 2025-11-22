#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"
ZDOTDIR="${ZDOTDIR:-$HOME}"

backup_and_link() {
  local rel_path="$1"
  local source_path="$DOTFILES_DIR/$rel_path"
  local target_path="$HOME/$rel_path"

  mkdir -p "$(dirname "$target_path")"

  if [[ -L "$target_path" && "$(readlink "$target_path")" == "$source_path" ]]; then
    echo "[skip] $target_path already points at repository version"
    return
  fi

  if [[ -e "$target_path" || -L "$target_path" ]]; then
    local backup="${target_path}.pre-zim.${TIMESTAMP}"
    mv "$target_path" "$backup"
    echo "[backup] $target_path -> $backup"
  fi

  ln -s "$source_path" "$target_path"
  echo "[link] $target_path -> $source_path"
}

sync_zsh_dir() {
  local source_dir="$DOTFILES_DIR/zsh"
  local target_dir="$HOME/.zsh"

  mkdir -p "$target_dir"
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --delete "$source_dir/" "$target_dir/"
  else
    rm -rf "$target_dir"
    cp -R "$source_dir" "$target_dir"
  fi
  echo "[sync] $target_dir <- $source_dir"
}

run_zimfw_install() {
  if ! command -v zsh >/dev/null 2>&1; then
    echo "zsh is required to run zimfw install" >&2
    return 1
  fi

  ZIM_SETUP='source ~/.zshrc >/dev/null 2>&1 && zimfw install'
  zsh -ic "$ZIM_SETUP" && echo "[zimfw] modules installed"
}

backup_and_link ".zshrc"
backup_and_link ".zprofile"
backup_and_link ".zimrc"
sync_zsh_dir
run_zimfw_install

echo "All set. Open a new terminal session to use Zimfw + Holmes prompt."
