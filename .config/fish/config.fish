set fish_greeting

set -x EDITOR vim
set -x GOPATH $HOME/go
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x NVM_DIR $HOME/nvm
set -x RBENV_DIR $HOME/.rbenv
set -x VISUAL $EDITOR

# Docker
set -x DOCKER_HOST tcp://127.0.0.1:2375

# Paths
function add_path --argument-names path
  test -d $path; and set PATH $path $PATH
end

add_path /usr/local/bin
add_path /usr/local/sbin
add_path $HOME/.dotfiles/bin
add_path $GOPATH/bin

# Navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias k 'l'
alias l 'tree --dirsfirst -aFCNL 1'
alias ll 'tree --dirsfirst -aLpughDFiC 1'
alias lsd 'll -d'

# Completions
function make_completion --argument-names alias command
  echo "
  function __alias_completion_$alias
    set -l cmd (commandline -o)
    set -e cmd[1]
    complete -C\"$command \$cmd\"
  end
  " | .
  complete -c $alias -a "(__alias_completion_$alias)"
end

function alias_and_complete --argument-names alias command
  make_completion $alias "$command"
  alias $alias "$command"
end

# Utilities
alias bs 'pushd $HOME/dotfiles; and bash bootstrap.sh; popd'
alias df 'df -h'
alias fs 'stat -f "%z bytes"'
alias_and_complete g 'git'
alias_and_complete ga 'git add -Av'
alias_and_complete gc 'git commit'
alias_and_complete gco 'git checkout'
alias_and_complete gd 'git diff'
alias_and_complete gdc 'git diff --cached'
alias_and_complete ggpull 'git pull origin $current_branch'
alias_and_complete ggpush 'git push origin $current_branch'
alias glog 'git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias gpa 'git push origin $current_branch; and git push --tags'
alias_and_complete gst 'git status'
alias ip 'curl -s http://checkip.dyndns.com/ | sed "s/[^0-9\.]//g"'
alias md 'mkdir -p $argv; cd $argv'
alias whois 'whois -h whois-servers.net'
alias_and_complete tma 'tmux attach -t'
alias_and_complete tmk 'tmux kill-session -t'
alias tml 'tmux list-sessions'
function tmn
  if not test -z $argv
    set name $argv
  else
    set name (basename (pwd) | sed 's/^\.//')
  end

  tmux new -s "$name"
end
alias vclean 'rm $HOME/.vim/swaps/*'

# node.js
if test ! -d $NVM_DIR
  mkdir -p $NVM_DIR
end
. $HOME/.vendor/nvm-fish/nvm.fish

function npms
  npm search --registry=https://registry.npmjs.org $argv
end

function npm-stable
  npms $argv | grep -E '2014-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
end

# rbenv
if hash rbenv 2> /dev/null; and test -d $RBENV_DIR
  set PATH $HOME/.rbenv/bin $PATH
  set PATH $HOME/.rbenv/shims $PATH
  rbenv rehash >/dev/null ^&1
end

# z
. ~/.vendor/z-fish/z.fish

# OSX-specific
if test (uname -s) = 'Darwin'
  add_path /usr/local/lib/python2.7/site-packages

  alias brewup 'brew update; and brew upgrade'
  alias dsstore 'find . -name "*.DS_Store" -type f -ls -delete'
  alias o 'open .'
end
