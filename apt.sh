#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y \
  autoconf \
  bc \
  build-essential \
  fish \
  git-core \
  htop \
  libncurses5-dev \
  libssl-dev \
  telnet \
  tree
