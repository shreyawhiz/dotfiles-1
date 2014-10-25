# OSX-only
is_osx || return 1

# Install Homebrew
if ! program_exists "brew"; then
  notice "Installing Homebrew"
  true | /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if program_exists "brew"; then
  notice "Updating Homebrew"
  brew update
fi

# Install Homebrew Cask Plugin
if ! brew cask &> /dev/null; then
  notice "Installing Homebrew Cask Plugin"
  brew tap phinze/homebrew-cask 2> /dev/null
  brew install brew-cask 2> /dev/null
fi

# Install Homebrew Casks
if brew cask &> /dev/null; then
  casks=(
    appzapper
    divvy
    flux
    virtualbox
  )

  list="$(to_install "${casks[*]}" "$(brew cask list)")"
  if [[ "$list" ]]; then
    notice "Installing Homebrew Casks: ${list[*]}"
    brew cask install $list
  fi
fi

# Install Homebrew Recipes
if program_exists "brew"; then
  recipes=(
    ack
    autoconf
    cloc
    colortail
    git
    git-extras
    go
    lesspipe
    nmap
    sl
    tmux
    tree
    watch
    wget
    zsh
  )

  list="$(to_install "${recipes[*]}" "$(brew list)")"
  if [[ "$list" ]]; then
    notice "Installing Homebrew Recipes: ${list[*]}"
    brew install $list
  fi
fi
