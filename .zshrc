if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

# Directory

setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt EXTENDED_GLOB

# Miscellaneous

alias bs='~/dotfiles/bootstrap.sh && source ~/.zshrc'
alias fs='stat -f '%z bytes''
alias ga='git add -Av'
alias gd='git diff'
alias gdc='git diff --cached'
alias gst='git status'
alias l='ls -al'
alias md='mkdir -p $argv; cd $argv'
alias vclean='rm $HOME/.vim/swaps/*'

# Node.js

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

npm-stable() {
  npms $argv | grep -E '2014-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
}

# OSX-specific

if [ $(uname -s) = 'Darwin' ]; then
  alias brewup='brew update; and brew upgrade'
  alias dsstore='find . -name "*.DS_Store" -type f -ls -delete'
  alias o='open .'
fi

# tmux

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
