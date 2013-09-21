# Git shortcuts
alias g "git"
alias clone "g clone"
alias ga "git add -A"
alias gb 'git branch'
alias gba 'git branch -a'
alias gc "git commit"
alias gcb 'gc -b'
alias gcd 'git rev-parse 2>/dev/null and cd "./(git rev-parse --show-cdup)"'
alias gcl 'git clone'
alias gcm "git commit -m"
alias gd "git diff"
alias gdc 'gd --cached'
alias gl 'git log'
alias gm 'git commit -m'
alias gma 'git commit -am'
alias gp 'git push'
alias gpa 'gp --all'
alias gr "git remote"
alias gr 'git remote'
alias grr 'git remote rm'
alias grv "gr -v"
alias grv 'gr -v'
alias gs 'git status'
alias gst 'gs'
alias gsu "git submodule update --init"
alias gu 'git pull'

# Shows files changed for a given path (gfc master..release)
alias gfc "git diff-tree --no-commit-id --name-only -r"

# Shorter more useful log
alias glog 'git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
