# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Browser

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Docker

source "$HOME/.dockerfunc"
DOCKER_HOST=tcp://192.168.99.101:2376
DOCKER_MACHINE_NAME=default
DOCKER_TLS_VERIFY=1
DOCKER_CERT_PATH=/Users/bentruyman/.docker/machine/machines/default

# Editors

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Language

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Less

export LESS='-F -g -i -M -R -S -w -X -z-4'

if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Utilities

alias reload='source $HOME/.zshenv'
