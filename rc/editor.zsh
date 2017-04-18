export ALTERNATE_EDITOR=""
export EDITOR="vim"
export GIT_EDITOR="vim"
(( $+commands[code] )) && {
  export EDITOR="code"
}

unset VISUAL
