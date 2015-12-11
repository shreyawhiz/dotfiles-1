if [ $(uname -s) = 'Darwin' ]; then
  code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

  alias brewup='brew update && brew upgrade'
  alias dsstore='find . -name "*.DS_Store" -type f -ls -delete'
  alias o='open .'
fi
