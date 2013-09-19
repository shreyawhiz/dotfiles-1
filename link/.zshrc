# Add binaries to path
PATH=:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin:~/.dotfiles/bin:/usr/local/share/python
export PATH

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Path to oh-my-zsh
export ZSH=$HOME/.dotfiles/vendor/oh-my-zsh

# Set to the name theme to load
export ZSH_THEME="mortalscumbag"

# Plugin config
export ZSH_TMUX_AUTOSTART=false

# Prevent oh-my-zsh from autoupdating
export DISABLE_AUTO_UPDATE="true"

# oh-my-zsh plugins
plugins=(brew git node npm nyan osx tmux)

# Restrict the number of history items to remember
export HISTSIZE=10000
export SAVEHIST=10000

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Source files
for file in ~/.dotfiles/source/*; do
  source "$file"
done
