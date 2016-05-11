# Dotfiles

[![Build Status](https://travis-ci.org/bentruyman/dotfiles.svg?branch=master)](https://travis-ci.org/bentruyman/dotfiles)

![Screenshot of my shell prompt](https://cloud.githubusercontent.com/assets/85315/15190505/10d8e504-1765-11e6-9841-afab3d554cf6.png)

## Installation

    git clone --recursive https://github.com/bentruyman/dotfiles.git \
     && cd dotfiles \
     && source bootstrap.sh

## Usage

These dotfiles add/configure the following:

- go
- iTerm2
- Neovim
- node/nvm
- OS X
- tmux
- zsh

The above list is not exhaustive of the programs installed as part of these
dotfiles. Please review the programs installed in the
[init](https://github.com/bentruyman/dotfiles/tree/master/init) directory.

### Directories

This dotfiles repository contains several directories. Below are
descriptions for the intention/purpose for each of them.

#### `/backups`

When running `bootstrap.sh`, any conflicting files will be backed up here in
the case of accidental overwrites.

#### `/config`

Modern application configuration such as `nvim` is found here.

#### `/env`

Each script found in this directory will be executed during shell login.

#### `/env-priv`

Each script found in this directory will be executed during shell login after
the above `/env` scripts. The only difference between these and the above
scripts are that these scripts are ignored from Git, so any sensitive
information won't accidentally be committed.

#### `/init`

Contains scripts that should initialize certain platforms after the dotfiles
have been installed.

## Special Thanks

My dotfiles are the result of inspiration or outright stealing from:

* Ben Alman and his [dotfiles](https://github.com/cowboy/dotfiles)
* Gianni Chiappetta and his [dotfiles](https://github.com/gf3/dotfiles)
* Mathias Bynens and his [dotfiles](https://github.com/mathiasbynens/dotfiles)

## License

Copyright (c) 2016 Ben Truyman<br>
Licensed under the [MIT license](https://github.com/bentruyman/dotfiles/blob/master/LICENSE-MIT).
