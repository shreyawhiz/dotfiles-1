export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh
#
ZSH_THEME='mortalscumbag'
DISABLE_AUTO_UPDATE='true'
plugins=(
  brew
  brew-cask
  docker
  encode64
  extract
  git
  gitfast
  jsontools
  node
  npm
  nvm
  osx
  per-directory-history
  sudo
  vagrant
)

# General

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vim

export EDITOR=vim
export GOPATH=$HOME/go
export NVM_DIR=$HOME/.vendor/nvm
export VISUAL=$EDITOR

# Docker

export DOCKER_HOST=tcp://127.0.0.1:2375

# Initialize oh-my-zsh

source $ZSH/oh-my-zsh.sh

# Node.js

. $HOME/.vendor/nvm/nvm.sh

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

npm-stable() {
  npms $argv | grep -E '2014-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
}

# Miscellaneous

alias bs="~/dotfiles/bootstrap.sh && source ~/.zshrc"
alias fs='stat -f "%z bytes"'
alias ga='git add -Av'
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias md='mkdir -p $argv; cd $argv'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tml='tmux list-sessions'
tmn() {
  if [ ! -z $argv ]; then
    name=$argv
  else
    name=$(basename $(pwd) | sed 's/^\.//')
  fi
  echo $name

  tmux new -s "$name"
}
alias vclean='rm $HOME/.vim/swaps/*'

# OSX-specific
if [ $(uname -s) = 'Darwin' ]; then
  alias brewup='brew update; and brew upgrade'
  alias dsstore='find . -name "*.DS_Store" -type f -ls -delete'
  alias o='open .'
fi
