#!/usr/bin/env bash
set -e

dotfiles_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
all_files=$( ls . )
ignored_files="
  LICENSE-MIT
  README.md
  backups
  bootstrap.sh
  init
"
dotfiles=$( echo $all_files $ignored_files | tr ' ' '\n' | sort | uniq -u )
timestamp=$( date +%s )
backup_dir="$dotfiles_dir/backups/$timestamp"

backup=
link=

function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }

# Introduction
echo "     _               ___ _ _             "
echo "    | |       _     / __|_) |            "
echo "  __| | ___ _| |_ _| |__ _| | _____  ___ "
echo " / _  |/ _ (_   _|_   __) | || ___ |/___)"
echo "( (_| | |_| || |_  | |  | | || ____|___ |"
echo " \____|\___/  \__) |_|  |_|\_)_____|___/ "
echo "                       by: Ben Truyman   "

# Backup
e_header "Backing up dotfiles"
for file in $dotfiles; do
  if [[ -f "$HOME/.$file" && ! -L "$HOME/.$file" ]]; then
    [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"
    backup=1
    e_success "$HOME/.$file"
    mv "$HOME/.$file" "$backup_dir"
  fi
done

if [[ -z "$backup" ]]; then
  e_success "Nothing to backup"
fi

# Link
e_header "Linking dotfiles"
for file in $dotfiles; do
  if [[ ! -L $HOME/.$file ]] || [[ $(readlink "$HOME/.$file") != "$dotfiles_dir/$file" ]]; then
    link=1
    e_success "$dotfiles_dir/$file -> $HOME/.$file"
    ln -fs "$dotfiles_dir/$file" "$HOME/.$file"
  fi
done

if [[ -z "$link" ]]; then
  e_success "Nothing to link"
fi

e_header "Done!"
