# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Browser

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Docker

if hash docker 2> /dev/null && hash docker-machine 2> /dev/null; then
  if [[ $(docker-machine status default) != "Running" ]]; then
    docker-machine start default &> /dev/null
  fi
  source "$HOME/.dockerfunc"
  eval "$(docker-machine env default)"
fi

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
