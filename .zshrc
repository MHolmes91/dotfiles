# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Language stuff
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzrg() {
  LOCATION=${1:-.}
  rg "" $LOCATION | fzf
}

fzfind() {
  LOCATION=${1:-.}
  rg --files $LOCATION | fzf
}

termtitle() {
  TERM_TITLE=${1:-Terminlul}
  echo -n -e "\033]0;$TERM_TITLE\007"
}

#Added local bin
export PATH=$PATH:$HOME/bin

export EDITOR='nvim'
export VISUAL='code'

alias terminal="open /Applications/iTerm.app"
alias myip="curl https://api.ipify.org"
alias nvimf="nvim \$(fzf)"
