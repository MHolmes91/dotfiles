# Setup zprezto first before linking with source ~/Repo/location/dotfiles/.zshrc and ~/Repo/location/dotfiles/.zprofile

# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

# Added Homebrew bin
export PATH="/opt/homebrew/bin:$PATH"

# Add ASDF
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH=":$PATH:$ASDF_DATA_DIR/shims"

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

# Added local bin
export PATH=$PATH:$HOME/bin

export EDITOR='nvim'
export VISUAL='nvim'
export REACT_EDITOR='nvim'

alias terminal="open /Applications/iTerm.app"
alias myip="curl https://api.ipify.org"
alias nvimf="nvim \$(fzf)"
