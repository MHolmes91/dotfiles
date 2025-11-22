# How to use:
#
# 1. Setup zprezto
#
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done
#
# 2. Link files
# After zprezto is setup then add the following lines to the bottom of their respective files
#
# source ~/Repo/location/dotfiles/.zshrc
# source ~/Repo/location/dotfiles/.zprofile
# source ~/Repo/location/dotfiles/.zpreztorc

# Add ASDF
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Added local bin
export PATH="$HOME/bin:$PATH"

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

export EDITOR='nvim'
export VISUAL='nvim'
export REACT_EDITOR='nvim'

alias myip="curl https://api.ipify.org"
alias nvimf="nvim \$(fzf)"
