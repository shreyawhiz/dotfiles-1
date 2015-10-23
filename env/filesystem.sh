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

unalias rm 2> /dev/null

if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  # Respect source control ignores
  export FZF_DEFAULT_COMMAND='ag -l -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
