_bt_prefix_path() {
    [[ ${path[(r)$1]} ]] || {
        [[ -d $1 ]] && path=($1 $prefix)
    }
}

_bt_suffix_path() {
    [[ ${path[(r)$1]} ]] || {
        [[ -d $1 ]] && path=($path $1)
    }
}
_bt_is_macos() {
    [[ $(uname -s) = 'Darwin' ]]
}

_bt_is_ubuntu() {
    [[ "$(cat /etc/lsb-release 2> /dev/null | head -1 2> /dev/null)" =~ Ubuntu ]]
}
