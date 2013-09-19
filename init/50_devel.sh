# Load development environment
source $HOME/.dotfiles/source/50_devel.sh

# Install Git Extras
if ! program_exists "git-extras"; then
  notice "Installing Git Extras"
  (
    cd "$HOME/.dotfiles/vendor/git-extras" && make install
  )
fi

# Install Node.js stable
if [[ "$(declare -f nvm)" ]]; then
  nvm_stable=`curl -s http://nodejs.org/dist/latest/ | grep -o 'node-v.*\"' -m 1 | grep -o 'v[0-9]*\.[0-9]*\.[0-9]*'`

  # Check to see if the current version of node is the latest stable
  if [[ "$(node --version 2>/dev/null)" != "$nvm_stable" ]]; then
    notice "Installing Node.js $nvm_stable"
    nvm install $nvm_stable
  fi

  # Alias the latest stable version
  if [[ ! "$(nvm alias default | grep $nvm_stable 2> /dev/null)" ]]; then
    notice "Updating nvm default alias to $nvm_stable"
    nvm alias default $nvm_stable
  fi
fi

# Install NPM global modules
if program_exists "npm"; then
  modules=(
    coffee-script
    express
    forever
    grunt-cli
    instant-markdown-d
    jshint
    less
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

# Set shell to ZSH
if program_exists "zsh"; then
  if [[ ! "$(cat /etc/shells | grep `which zsh`)" ]]; then
    which zsh | sudo tee -a /etc/shells
  fi

  if [[ "$SHELL" != `which zsh` ]]; then
    notice "Changing shell to `which zsh`"
    chsh -s `which zsh`
  fi
fi

# Install Ruby stable
if program_exists "rbenv"; then
  rbenv_stable="$(rbenv install --list | grep "1.9.3-p[0-9]" | sort -n | tail -1)"
  if [[ ! "$(rbenv versions | grep $rbenv_stable)" ]]; then
    rbenv install $rbenv_stable
    rbenv global $rbenv_stable
  fi
fi
