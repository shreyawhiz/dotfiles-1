[[ $(uname -s) = 'Darwin' ]] || return 1

# Load gcloud completions
if hash gcloud &> /dev/null; then
  source "/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

alias brewup='brew update && brew upgrade'
alias dsstore='find . -name "*.DS_Store" -type f -ls -delete'
alias o='open .'
