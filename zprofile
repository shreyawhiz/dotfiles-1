# Browser

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Docker

if hash boot2docker 2> /dev/null; then
  eval $(boot2docker shellinit 2>/dev/null)
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
