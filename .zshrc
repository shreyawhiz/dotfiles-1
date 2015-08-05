if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

# Directories/Files

setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt EXTENDED_GLOB
setopt RMSTARSILENT

alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -al'
md() {
  mkdir -p "$argv"
  cd "$argv"
}
unalias rm

# Dotfiles

alias bs='~/dotfiles/bootstrap.sh && source ~/.zshrc'

# FZF

if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  # Respect source control ignores
  export FZF_DEFAULT_COMMAND='ag -l -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Git

alias ga='git add -Av'
alias gd='git diff'
alias gdc='git diff --cached'
alias gst='git status'

# Node.js

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

npm-stable() {
  npms $argv | grep -E '2014-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
}

# OSX-specific

if [ $(uname -s) = 'Darwin' ]; then
  alias brewup='brew update && brew upgrade'
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

# vim

alias vclean='rm $HOME/.vim/swaps/*'
