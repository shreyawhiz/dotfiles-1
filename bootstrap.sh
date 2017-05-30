#!/usr/bin/env bash
set -e

_did_backup=
_copy_count=0
_link_count=0
ARROW='>'

dotfiles_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
backup_dir="$dotfiles_dir/backups/$(date +%s)"

# TODO: parse flags like --exclude=[file....] to prevent syncing certain files
# TODO: D.R.Y. up the copy_file and link_file functions

copy_file() {
  local src_file
  local dest_file

  src_file=$(get_src_path "$1")
  dest_file=$(get_dest_path "$1")

  if ! files_are_same "$src_file" "$dest_file"; then
    file_exists "$dest_file" && backup_file "$dest_file"
    cp "$src_file" "$dest_file"
    _copy_count=$((_copy_count + 1))
    report_install "$src_file" "$dest_file"
  fi
}

link_file() {
  local src_file
  local dest_file

  src_file=$(get_src_path "$1")
  dest_file=$(get_dest_path "$1")

  if ! files_are_linked "$src_file" "$dest_file"; then
    file_exists "$dest_file" && backup_file "$dest_file"
    ln -sf "$src_file" "$dest_file"
    _link_count=$((_link_count + 1))
    report_install "$src_file" "$dest_file"
  fi
}

get_src_path() {
  echo "$dotfiles_dir/$1"
}

get_dest_path() {
  echo "$HOME/.$1"
}

backup_file() {
  local file=$1
  _did_backup=1

  [[ -d $backup_dir ]] || mkdir -p "$backup_dir"
  mv "$file" "$backup_dir"
}

did_backup() {
  [[ -z _did_backup ]]
}

file_exists() {
  [[ -f "$1" ]] || [[ -d "$1" ]]
}

files_are_same() {
  [[ ! -L "$2" ]] && cmp --silent "$1" "$2"
}

files_are_linked() {
  if [[ ! -L "$2" ]] || [[ $(readlink "$2") != "$1" ]]; then
    return 1
  fi
}

report_header() {
  echo -e "\n\033[1m$*\033[0m";
}

report_success() {
  echo -e " \033[1;32m✔\033[0m  $*";
}

report_install() {
  report_success "$1 $ARROW $2"
}

# TODO: add flag to prevent ascii art
# Introduction
echo "     _               ___ _ _             "
echo "    | |       _     / __|_) |            "
echo "  __| | ___ _| |_ _| |__ _| | _____  ___ "
echo " / _  |/ _ (_   _|_   __) | || ___ |/___)"
echo "( (_| | |_| || |_  | |  | | || ____|___ |"
echo " \____|\___/  \__) |_|  |_|\_)_____|___/ "
echo "                       by: Ben Truyman   "

# Install
report_header "Copying files..."
copy_file "gitconfig"
echo "$_copy_count files copied"

report_header "Linking files..."
link_file "bin"
link_file "config"
link_file "fzf"
link_file "hushlogin"
link_file "local"
link_file "rc"
link_file "tmux.conf"
link_file "tmux"
link_file "vim"
link_file "zlogin"
link_file "zprezto"
link_file "zpreztorc"
link_file "zprofile"
link_file "zsh"
link_file "zshenv"
link_file "zshrc"
echo "$_link_count files linked"

# Backup Results
did_backup && report_header "Backed up some files to: $backup_dir"

# Fin
report_header "Done!"
