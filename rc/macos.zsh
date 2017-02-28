_bt_is_macos && {
  export BROWSER="open"

  # Load direnv
  (( $+commands[direnv] )) && {
    eval "$(direnv hook zsh)"
  }

  # Load gcloud completions
  GCLOUD_DIR="/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"

  (( $+commands[gcloud] )) && {
    [[ -s "$GCLOUD_DIR/path.zsh.inc" ]] && . "$GCLOUD_DIR/path.zsh.inc"
    [[ -s "$GCLOUD_DIR/completion.zsh.inc" ]] && . "$GCLOUD_DIR/completion.zsh.inc"
  }
}
