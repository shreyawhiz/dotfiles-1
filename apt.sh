#!/usr/bin/env bash

sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

apt-get update
apt-get upgrade

apt-get install \
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
