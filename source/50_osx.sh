[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Paths
export PATH="$PATH:/usr/local/lib/python2.7/site-packages"

# Updates homebrew index and upgrades installed packages
alias brewup='brew update && brew upgrade'

# DROID
alias droid="say -v zarvox droid"

# Recursively deletes .DS_Store files
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Flushes dns caches
alias flushdns="dscacheutil -flushcache"

# Opens current directory in Finder
alias o="open ."

# SSH into talos
alias talos="ssh bentruyman@talos"

# Start tmux with 256 color support
alias tmux="TERM=screen-256color-bce tmux"
