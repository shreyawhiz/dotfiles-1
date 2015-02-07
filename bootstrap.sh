#!/usr/bin/env bash

rsync \
  --exclude ".git/" \
  --exclude ".gitmodules" \
  --exclude "apt.sh" \
  --exclude "bootstrap.sh" \
  --exclude "brew.sh" \
  --exclude "LICENSE-MIT" \
  --exclude "README.md" \
  -avh --no-perms . $HOME;
