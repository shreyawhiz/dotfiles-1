#!/usr/bin/env bash

rsync \
  --exclude ".git/" \
  --exclude "bootstrap.sh" \
  --exclude "LICENSE-MIT" \
  --exclude "README.md" \
  -avh --no-perms . ~;
