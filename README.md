# Dotfiles

My dotfiles and system bootstrap for OS X and Ubuntu.

## Installation

Ensure the curent user is an administrator and run:

    bash -c "$(curl -fsSL https://raw.github.com/bentruyman/dotfiles/master/bin/dotfiles)"

## How It Works

Most of the magic happens inside of the `dotfiles` script located at `.dotfiles/bin/dotfiles`. It's responsible for bootstrapping your entire system through a couple steps. As long as your user has administrator priviledges and has `sudo` access, this script should be able to figure out and install all dependencies required to get your system up and running with these dotfiles.

**NOTE:** There are currently no backup facilities built into the `dotfiles` script, so be aware that any existing dotfiles may be overwritten.

### init

Scripts located in the [`.dotfiles/init`](https://github.com/bentruyman/dotfiles/tree/master/init) directory are executed in alphanumeric order. As the name implies, these scripts perform much of the initialization steps like installing useful software and packages.

### link

Files and directories located in the [`.dotfiles/link`](https://github.com/bentruyman/dotfiles/tree/master/link) directory will by symlinked into your `$HOME` directory likely to be found and used by other programs such as tmux or vim.

### bin

Scripts located in the [`.dotfiles/bin`](https://github.com/bentruyman/dotfiles/tree/master/bin) directory are executables that can be used during your terminal session. Basically, this directory will be added to your `$PATH` and anything inside of it should be available to invoke. Make sure that if you add anything to this directory that you give it executable permissions (`chmod +x new_script`)

## What's Included?

### Homebrew

It's hard to live without [Homebrew](http://brew.sh/) on OS X. It will be installed and used to install both [command-line](https://github.com/bentruyman/dotfiles/blob/master/init/10_osx.sh#L24) and [desktop](https://github.com/bentruyman/dotfiles/blob/master/init/10_osx.sh#L60) programs.

### Git

If Git is not installed, it should be installed by your system's package manager (Homebrew on OSX and APT on Ubuntu). To make the Git experience even better, [git-extras](https://github.com/visionmedia/git-extras) will also be installed. Lastly, a bunch of aliases [including my own](https://github.com/bentruyman/dotfiles/blob/master/source/50_vcs.sh) as well as those provided by an [oh-my-zsh plugin](http://jasonm23.github.io/oh-my-git-aliases.html) will be created.

### Node.js + nvm

During the init step, the latest stable version of Node.js will be installed through [nvm](https://github.com/creationix/nvm). This installation, and global modules installed through `npm`, will be installed only for your user.

### Ruby + rbenv

During the init step, the latest version of Ruby 1.9.3 will be installed through [rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build). This installation, and gems installed, will be installed only for your user.

### Vim + Neobundle

Vim is a great editor. [Neobundle](https://github.com/Shougo/neobundle.vim) is a great plugin manager for Vim. Rather than attempt to explain all of the customizations, I've organized and documented all of the Vim configuration inside my [.vimrc](https://github.com/bentruyman/dotfiles/blob/master/link/.vimrc) file. One notable configuration difference is that I use `\` for my `<leader>`.

One thing to note, instead of using the popular Powerline plugin I opted for what I consider a much simpler alternative called SlantStatus. You'll need to pick up and install one of the modified fonts either [here](https://github.com/danheberden/vim-slantstatus/tree/master/fonts) or [here](https://github.com/Lokaltog/powerline-fonts) for proper rendering. Eventually, I'll likely incorporate font installation as a part of the bootstrapping process.

### TMUX

The included [.tmux.conf](https://github.com/bentruyman/dotfiles/blob/master/link/.tmux.conf) is fairly standard. One thing to note is that `^A` is the prefix instead of `^B` (similar to `screen`). The status bar, just like Vim, will require a modified font to be installed for proper rendering.

### ZSH + oh-my-zsh

If ZSH is not installed, it (should) be installed by your system's package manager (Homebrew on OSX and APT on Ubuntu). [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) will also utilized for a [few plugins](https://github.com/bentruyman/dotfiles/blob/master/link/.zshrc#L23) and a theme. Granted, I don't use oh-my-zsh for a whole lot, and may remove it sometime in the future.

The prompt which is created by the `mortalscumbag` oh-my-zsh theme features Git status indicators, last exit code, and a badge to let you know if the current session was logged in over SSH. Here's an example of what that prompt looks like:

**NOTE:** While ZSH might already be installed, a newer version will try to be installed by your system's package manager.

![ZSH Prompt](https://i.cloudup.com/9qTAguXk3d-2000x2000.png)

## Special Thanks

My dotfiles are the result of inspiration or outright stealing from:

* Ben Alman and his [dotfiles](https://github.com/cowboy/dotfiles)
* Gianni Chiappetta and his [dotfiles](https://github.com/gf3/dotfiles)
* Mathias Bynens and his [dotfiles](https://github.com/mathiasbynens/dotfiles)

## License

Copyright (c) 2013 Ben Truyman<br>
Licensed under the [MIT license](https://github.com/bentruyman/dotfiles/blob/master/LICENSE-MIT).
