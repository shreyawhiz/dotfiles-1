# Easier navigation
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Outputs filesize in bytes
alias df="df -h"
alias fs="stat -f "%z bytes""

# Directory listing
alias k="l"
alias l="ls -al"

if type -P tree
  alias ll='tree --dirsfirst -aLpughDFiC 1'
  alias lsd='ll -d'
else
  alias ll='ls -al'
  alias lsd='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
end

# Creates a new directory and enter it
function md
  mkdir -p $argv
  cd $argv
end

# Initialize z
source ~/.dotfiles/vendor/z-fish/z.fish
