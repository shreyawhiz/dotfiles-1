#!/usr/bin/env bash
set -e

[[ "$(cat /etc/lsb-release 2> /dev/null | head -1 2> /dev/null)" =~ Ubuntu ]] || return 1

LINUXBREW="$HOME/.linuxbrew/bin/brew"

###############################################################################
# apt-get
###############################################################################

sudo add-apt-repository -y ppa:pi-rho/dev

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
  autoconf \
  bc \
  build-essential \
  curl \
  git \
  git-core \
  libbz2-dev \
  libcurl4-openssl-dev \
  libexpat-dev \
  libncurses-dev \
  libncurses5-dev \
  libssl-dev \
  m4 \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  ruby \
  software-properties-common \
  telnet \
  texinfo \
  tree \
  zlib1g-dev

###############################################################################
# Linuxbrew
###############################################################################

if [[ ! -f "$LINUXBREW" ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
fi

 $LINUXBREW update
 $LINUXBREW install \
  git-extras \
  htop \
  tmux \
  vim \
  zsh

###############################################################################
# Shell
###############################################################################

ZSH_BIN="$HOME/.linuxbrew/bin/zsh"

# Add ZSH to list of valid shells
if [[ "$ZSH_BIN" && $(grep -L "$ZSH_BIN" /etc/shells) ]]; then
  echo "$ZSH_BIN" | sudo tee -a /etc/shells &> /dev/null
fi

# Change shell to ZSH
if [[ "$SHELL" != "$ZSH_BIN" ]]; then
  sudo chsh -s "$ZSH_BIN" "$USER"
  env "$ZSH_BIN"
fi

