#!/usr/bin/env bash
set -e

brew update
brew upgrade

if ! brew cask &> /dev/null; then
  brew tap phinze/homebrew-cask 2> /dev/null
  brew install brew-cask 2> /dev/null
fi

brew install \
  cloc \
  coreutils \
  docker \
  docker-machine \
  git \
  git-extras \
  go \
  imagemagick --with-webp \
  moreutils \
  nvm \
  rename \
  the_silver_searcher \
  tmux \
  tree \
  vim \
  watch \
  wget \
  zsh

brew cask install \
  flux \
  seil \
  spotify \
  vagrant \
  virtualbox

brew tap neovim/neovim
brew install --HEAD neovim

brew cleanup
