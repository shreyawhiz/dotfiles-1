# Dotfiles

[![Build Status](https://travis-ci.org/bentruyman/dotfiles.svg?branch=master)](https://travis-ci.org/bentruyman/dotfiles)

![Screenshot of my shell prompt](https://cloud.githubusercontent.com/assets/85315/23342118/64252c2a-fc09-11e6-9e75-ce511b4d6568.png)

## Installation

    git clone --recursive https://github.com/bentruyman/dotfiles.git \
     && cd dotfiles \
     && source bootstrap.sh

## Usage

These dotfiles add/configure the following:

- emacs/spacemacs
- go
- iTerm2
- macOS
- node/nvm
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

#### `/bin`

Executable scripts that will appear first in a user's `$PATH`.

#### `/init`

Contains scripts that should initialize certain platforms after the dotfiles
have been installed.

#### `/local`

Each script, named `<script>.zsh`, found in this directory will be executed
during shell login after the below `/rc` scripts. The only difference between
these and the `rc` scripts are that these scripts are ignored from Git, so any
sensitive information won't accidentally be committed.

#### `/rc`

Each script, named `<script>.zsh`, found in this directory will be executed
during shell login.

### Manual Steps

Due to automation limitations, some system provisioning steps must be completed
manually.

#### macOS

To configure macOS, run the `init/macos.sh` script.

#### Ubuntu

To configure Ubuntu, run the `init/ubuntu.sh` script.

## Special Thanks

My dotfiles are the result of inspiration or outright stealing from:

* Ben Alman and his [dotfiles](https://github.com/cowboy/dotfiles)
* Gianni Chiappetta and his [dotfiles](https://github.com/gf3/dotfiles)
* Mathias Bynens and his [dotfiles](https://github.com/mathiasbynens/dotfiles)

## License

Copyright (c) 2016 Ben Truyman<br>
Licensed under the [MIT license](https://github.com/bentruyman/dotfiles/blob/master/LICENSE-MIT).
