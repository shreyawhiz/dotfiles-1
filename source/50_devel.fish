# Add rbenv executables to path
set PATH $HOME/.dotfiles/vendor/rbenv/bin $PATH
set PATH $HOME/.dotfiles/vendor/rbenv/shims $PATH
set PATH $HOME/.dotfiles/vendor/ruby-build/bin $PATH

# Initialize rbenv
if type -P rbenv > /dev/null
  rbenv rehash >/dev/null ^&1
end
