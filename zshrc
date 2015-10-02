if [[ -s "$HOME/.zprezto/init.zsh" ]]; then
  source "$HOME/.zprezto/init.zsh"
fi

# Source environment scripts
for file in "$HOME"/.env/*.sh; do
  source $file
done
