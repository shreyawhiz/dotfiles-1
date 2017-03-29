__() {
  alias ec="emacsclient -c -n"
  alias et="emacsclient -c -t"

  export ALTERNATE_EDITOR=""
  export EDITOR="emacsclient -c -t"
  export GIT_EDITOR="vim"

  ed() {
    local args
    args=${@:-"."}
    echo args $args
  }

  ec() {
    local args

    if [[ -z "$@" ]]; then
      args="."
    else
      args="$@"
    fi

    exec emacsclient -c -n "$args"
  }

  _bt_is_macos && {
    export EMACS_BIN=/Applications/Emacs.app/Contents/MacOS/Emacs
  }
} && __

unset VISUAL
