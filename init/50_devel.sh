# Install Git Extras
if ! program_exists "git-extras"; then
  notice "Installing Git Extras"
  (
    cd "$HOME/.dotfiles/vendor/git-extras" && sudo make install
  )
fi

# Install NPM global modules
if program_exists "npm"; then
  modules=(
    coffee-script
    eslint
    forever
    instant-markdown-d
    node-dev
    serve
    uglify-js
  )

  { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } > /dev/null
  list="$(to_install "${modules[*]}" "${installed[*]}")"
  if [[ "$list" ]]; then
    notice "Installing Node Modules: ${list[*]}"
    npm install -g $list
  fi
fi

# Install fish shell if it isn't already
if ! program_exists "fish"; then
  (
    cd ~/.dotfiles/vendor/fish-shell
    autoconf
    ./configure
    make
    sudo make install
  )
fi

# Set shell to fish
if program_exists "fish"; then
  fish_location=$(which fish)
  if [[ ! "$(cat /etc/shells | grep "$fish_location")" ]]; then
    echo $fish_location | sudo tee -a /etc/shells
  fi

  if [[ ! "echo $FISH_VERSION" ]]; then
    notice "Changing shell to "$fish_location""
    chsh -s "$fish_location"
  fi
fi

# Install Ruby stable
PATH=$HOME/.dotfiles/vendor/rbenv/bin:$HOME/.dotfiles/vendor/ruby-build:$PATH
if program_exists "rbenv"; then
  rbenv_stable="$(rbenv install --list | grep "1.9.3-p[0-9]" | sort -n | tail -1)"
  if [[ ! "$(rbenv versions | grep $rbenv_stable)" ]]; then
    rbenv install $rbenv_stable
    rbenv global $rbenv_stable
  fi
fi
