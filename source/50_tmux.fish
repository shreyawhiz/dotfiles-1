# Start tmux with 256 color support
set -U TERM screen-256color-bce

# tmux shortcuts
alias tma 'tmux attach -t'
alias tmk 'tmux kill-session -t'
alias tml 'tmux list-sessions'

function tmn
  if test -n "$argv"
    tmux new -s $argv
  else
    tmux new -s (basename (pwd))
  end
end
