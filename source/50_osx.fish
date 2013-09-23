if [ (uname -s) != 'Darwin' ]
  exit 1
end

# Paths
set PATH $PATH /usr/local/lib/python2.7/site-packages

# Updates homebrew index and upgrades installed packages
alias brewup 'brew update; and brew upgrade'

# DROID
alias droid 'say -v zarvox droid'

# Recursively deletes .DS_Store files
alias dsstore 'find . -name "*.DS_Store" -type f -ls -delete'

# Flushes dns caches
alias flushdns 'dscacheutil -flushcache'

# Opens current directory in Finder
alias o 'open .'

# SSH into talos
alias talos 'ssh bentruyman@talos'
