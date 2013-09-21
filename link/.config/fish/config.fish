# Add binaries to path
set PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin \
         ~/.dotfiles/bin /usr/local/share/python

# Set locale
set -U LC_ALL en_US.UTF-8
set -U LANG en_US.UTF-8
set -U LANGUAGE en_US.UTF-8

# Source files
for file in ~/.dotfiles/source/*
  source "$file"
end
