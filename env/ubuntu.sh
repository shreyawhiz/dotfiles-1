[[ "$(cat /etc/lsb-release 2> /dev/null | head -1 2> /dev/null)" =~ Ubuntu ]] || return 1

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
