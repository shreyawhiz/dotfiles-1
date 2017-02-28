(( $+commands[tmux] )) && {
  alias tma="tmux attach -d -t"
  alias tmk="tmux kill-session -t"
  alias tml="tmux list-sessions"

  tmn() {
    if [[ ! -z "$1" ]]; then
      name=$1
    else
      name=$(basename $(pwd) | sed 's/^\.//')
    fi
    echo $name

    tmux new -s "$name"
  }
}
