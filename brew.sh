#!/usr/bin/env bash
set -e

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew update
brew upgrade

if ! brew cask &> /dev/null; then
  brew tap phinze/homebrew-cask 2> /dev/null
  brew install brew-cask 2> /dev/null
fi

brew install \
  cloc \
  coreutils \
  git \
  git-extras \
  go \
  imagemagick --with-webp \
  moreutils \
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
  vagrant \
  virtualbox

brew cleanup
