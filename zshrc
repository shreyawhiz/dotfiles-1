if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

# Don't complain about empty globs
setopt null_glob

# Source environment scripts
for file in "$HOME"/.env/*.sh; do
  source $file
done

# Source private environment scripts
for file in "$HOME"/.env-priv/*.sh; do
  source $file
done
