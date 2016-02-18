#!/usr/bin/env bash
set -e

[[ "$(head -1 < /etc/lsb-release 2> /dev/null)" =~ Ubuntu ]] || return 1

sudo apt-get update
sudo apt-get install -y software-properties-common

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:pi-rho/dev

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
  autoconf \
  bc \
  build-essential \
  git-core \
  htop \
  libncurses5-dev \
  libssl-dev \
  neovim \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  telnet \
  tree
