#!/usr/bin/env bash
set -e

brew update
brew upgrade

if ! brew cask &> /dev/null; then
  brew tap phinze/homebrew-cask 2> /dev/null
  brew install brew-cask 2> /dev/null
fi

brew tap choppsv3/eerm24
brew tap neovim/neovim

brew install \
  choppsv1/term24/tmux \
  choppsv1/term24/vim \
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
  tree \
  watch \
  wget \
  zsh

brew install --HEAD \
  neovim

brew cask install \
  flux \
  seil \
  spotify \
  vagrant \
  virtualbox

brew cleanup
