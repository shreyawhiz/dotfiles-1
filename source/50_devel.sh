export PATH

# Initialize nvm
source $HOME/.dotfiles/vendor/nvm/nvm.sh

# Initialize rbenv
PATH=$HOME/.dotfiles/vendor/rbenv/bin:$PATH
PATH=$HOME/.dotfiles/vendor/ruby-build/bin:$PATH
if [ "$(type -p rbenv)" ]; then
  eval "$(rbenv init -)"
fi
