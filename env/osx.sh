[[ $(uname -s) = 'Darwin' ]] || return 1

GCLOUD_DIR="/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"

# Load gcloud completions
if hash gcloud &> /dev/null; then
  [ -s "$GCLOUD_DIR/path.zsh.inc" ] && . "$GCLOUD_DIR/path.zsh.inc"
  [ -s "$GCLOUD_DIR/completion.zsh.inc" ] && . "$GCLOUD_DIR/completion.zsh.inc"
fi

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

alias brewup='brew update && brew upgrade'
alias dsstore='find . -name "*.DS_Store" -type f -ls -delete'
alias flushdns="sudo killall -HUP mDNSResponder"
alias o='open .'

if [[ -s /usr/local/opt/bind/sbin/named ]]; then
  alias redns='sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.bind.plist \
    && sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.bind.plist'
fi
