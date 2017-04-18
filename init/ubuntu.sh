#!/usr/bin/env bash
set -e

[[ "$(cat /etc/lsb-release 2> /dev/null | head -1 2> /dev/null)" =~ Ubuntu ]] || return 1

###############################################################################
# apt-get
###############################################################################

sudo apt-get update

sudo apt-get install -y \
  build-essential \
  git \
  linuxbrew-wrapper \
  python3-setuptools \
  software-properties-common

###############################################################################
# Linuxbrew
###############################################################################

brew upgrade
brew update
brew install \
  ansible \
  ccat \
  cloc \
  coreutils \
  direnv \
  git \
  git-extras \
  go \
  gpg \
  htop \
  imagemagick \
  moreutils \
  tldr \
  tmux \
  tree \
  watch \
  wget \
  zsh

###############################################################################
# Shell
###############################################################################

ZSH_BIN="$HOME/.linuxbrew/bin/zsh"

# Add ZSH to list of valid shells
if [[ -x "$ZSH_BIN" ]] && grep -q "$ZSH_BIN" /etc/shells; then
  echo "$ZSH_BIN" | sudo tee -a /etc/shells &> /dev/null
fi

# Change shell to ZSH
if [[ "$SHELL" != "$ZSH_BIN" ]]; then
  sudo chsh -s "$ZSH_BIN" "$USER"
  env "$ZSH_BIN"
fi
