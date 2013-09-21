# Ubuntu-only
is_ubuntu || return 1

# Update APT
notice "Updating APT"
sudo apt-get -qq update
sudo apt-get -qq upgrade

# Install APT packages
packages=(
  autoconf
  bc
  build-essential
  colortail
  git-core
  htop
  libncurses5-dev
  libssl-dev
  nmap
  telnet
  tree
  zsh
)

list=()
for package in "${packages[@]}"; do
  if [[ ! "$(dpkg -l "$package" 2>/dev/null | grep "^ii  $package")" ]]; then
    list=("${list[@]}" "$package")
  fi
done

if (( ${#list[@]} > 0 )); then
  notice "Installing APT packages: ${list[*]}"
  for package in "${list[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi
