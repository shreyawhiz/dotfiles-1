# Navigation
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -al'

# Git
alias ga='git add -Av'
alias gd='git diff'
alias gdc='git diff --cached'
alias gst='git status'

# Misc
unalias rm 2> /dev/null

# macOS
_bt_is_macos && {
  alias brewup="brew update && brew upgrade"
  alias dsstore="find . -name \"*.DS_Store\" -type f -ls -delete"
  alias o="open ."
}
