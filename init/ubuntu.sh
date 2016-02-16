#!/usr/bin/env bash
set -e

[[ "$(head -1 < /etc/lsb-release 2> /dev/null)" =~ Ubuntu ]] || return 1

sudo add-apt-repository -y ppa:pi-rho/dev

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install -y \
  autoconf \
  bc \
  build-essential \
  git-core \
  htop \
  libncurses5-dev \
  libssl-dev \
  telnet \
  tree \
  vim-nox
