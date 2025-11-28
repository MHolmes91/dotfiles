# Bootstrap Zimfw instead of Prezto and keep custom shell helpers in one place.

# Paths and tooling
if [[ -z "${DOTFILES_ROOT:-}" ]]; then
  DOTFILES_ROOT="${${(%):-%N}:A:h}"
fi
if [[ -z "$DOTFILES_ROOT" || ! -d "$DOTFILES_ROOT" ]]; then
  DOTFILES_ROOT="$HOME/Repositories/dotfiles"
fi
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$HOME/bin:$PATH"
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export EDITOR='nvim'
export VISUAL='nvim'
export REACT_EDITOR='nvim'

# Zimfw setup
export ZIM_HOME="${ZDOTDIR:-$HOME}/.zim"
export ZIM_CONFIG_FILE="${ZDOTDIR:-$HOME}/.zimrc"
mkdir -p "$ZIM_HOME"
if [[ ! -e "$ZIM_HOME/zimfw.zsh" ]]; then
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL https://raw.githubusercontent.com/zimfw/zimfw/master/zimfw.zsh >| "$ZIM_HOME/zimfw.zsh"
  else
    printf 'zimfw.zsh is missing and curl is unavailable; install zimfw manually.\n' >&2
  fi
fi
if [[ ! -x "$ZIM_HOME/zimfw.zsh" ]]; then
  chmod +x "$ZIM_HOME/zimfw.zsh"
fi
if [[ -r "$ZIM_HOME/zimfw.zsh" ]]; then
  if [[ ! "$ZIM_HOME/init.zsh" -nt "$ZIM_CONFIG_FILE" ]]; then
    source "$ZIM_HOME/zimfw.zsh" init -q
  fi
  if [[ -r "$ZIM_HOME/init.zsh" ]]; then
    source "$ZIM_HOME/init.zsh"
  fi
else
  printf 'Zimfw bootstrap skipped because %s is missing.\n' "$ZIM_HOME/zimfw.zsh" >&2
fi

if [[ -f "$DOTFILES_ROOT/zsh/themes/prompt_holmes.zsh" ]]; then
  source "$DOTFILES_ROOT/zsh/themes/prompt_holmes.zsh"
fi

# Shell behavior
bindkey -v
if (( ${+widgets[history-substring-search-up]} && ${+widgets[history-substring-search-down]} )); then
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
  bindkey -M viins '^P' history-substring-search-up
  bindkey -M viins '^N' history-substring-search-down
fi

# Quick helpers
fzrg() {
  local location=${1:-.}
  rg "" "$location" | fzf
}

fzfind() {
  local location=${1:-.}
  rg --files "$location" | fzf
}

termtitle() {
  local title=${1:-Terminal}
  printf '\033]0;%s\007' "$title"
}

alias myip='curl https://api.ipify.org'
alias nvimf='nvim $(fzf)'
alias cddf='cd ${DOTFILES_ROOT}'
