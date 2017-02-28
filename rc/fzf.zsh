[[ -f $HOME/.fzf.zsh ]] && {
  source $HOME/.fzf.zsh

  # Respect source control ignores
  export FZF_DEFAULT_COMMAND='
    (git ls-tree -r --name-only HEAD ||
     find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}
