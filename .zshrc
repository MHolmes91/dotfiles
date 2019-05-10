#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#Added local bin
export PATH=$PATH:$HOME/bin

export EDITOR='nvim'
export VISUAL='code'

alias terminal="open /Applications/Utilities/Terminal.app"
alias myip="curl https://api.ipify.org"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias nvimf="nvim \$(fzf)"

#Added Ant
export ANT_HOME=$HOME/bin/ant
export PATH=$PATH:$ANT_HOME/bin

#Added Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home

#Stytch AWS stuff (http://confluence/display/AR/Setting+up+dev+workstation+for+aws+and+docker)
export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=default

alias pull_leeroy='$(aws --profile docker ecr get-login --no-include-email) && docker pull 125950476760.dkr.ecr.us-east-1.amazonaws.com/stytch/leeroy:stable'
alias stable_leeroy="docker run -v ~/.aws/config:/root/.aws/config -v ~/.aws/credentials:/root/.aws/credentials -v ~/.ssh:/root/.ssh -e AWS_PROFILE=root -e AWS_SDK_LOAD_CONFIG=1 --rm 125950476760.dkr.ecr.us-east-1.amazonaws.com/stytch/leeroy:stable"
