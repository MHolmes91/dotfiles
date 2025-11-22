# Port of the Prezto "holmes" prompt for Zimfw.

function +vi-set_novcs_prompt_symbol {
  _prompt_holmes_symbol='$'
}

function +vi-set_vcs_prompt_symbol {
  _prompt_holmes_symbol='±'
}

function +vi-git_precmd {
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    hook_com[unstaged]+='%F{green}?%f'
  fi
}

function prompt_holmes_precmd {
  _prompt_holmes_pwd="${PWD/#$HOME/~}"
  vcs_info
}

function prompt_holmes_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook

  add-zsh-hook precmd prompt_holmes_precmd

  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' formats ' (%F{magenta}%b%f%c%u)'
  zstyle ':vcs_info:*' actionformats ' (%F{magenta}%b%f%c%u %F{yellow}(%a)%f)'
  zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
  zstyle ':vcs_info:*' unstagedstr '%F{green}!%f'

  zstyle ':vcs_info:*+start-up:*' hooks set_novcs_prompt_symbol
  zstyle ':vcs_info:git*+set-message:*' hooks set_vcs_prompt_symbol git_precmd
  zstyle ':vcs_info:*+set-message:*' hooks set_vcs_prompt_symbol

  PROMPT='%(?..%F{red}%B-> [%?]%b%f
)%F{magenta}%n%f@%F{yellow}%m%f %F{green}${_prompt_holmes_pwd}%f %F{blue}${_prompt_holmes_symbol}%f '
  RPROMPT='${vcs_info_msg_0_}'
  SPROMPT='zsh: correct %F{magenta}%R%f to %F{green}%r%f [nyae]? '
}

prompt_holmes_setup "$@"
