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
