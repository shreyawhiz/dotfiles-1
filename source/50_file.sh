# Easier navigation
alias .="pwd"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Outputs filesize in bytes
alias df="df -h"
alias fs="stat -f "%z bytes""

# Directory listing
alias k="l"
alias l="ls -al"

if [ "$(type -p tree)" ]; then
  alias ll='tree --dirsfirst -aLpughDFiC 1'
  alias lsd='ll -d'
else
  alias ll='ls -al'
  alias lsd='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
fi

# Creates a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# Initialize z
source $HOME/.dotfiles/vendor/z/z.sh
function precmd () {
  z --add "$(pwd -P)"
}
