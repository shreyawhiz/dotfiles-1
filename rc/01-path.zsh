__() {
    local -a current_path desired
    local p
    desired=(
        $HOME/.bin $GOPATH/bin
        /usr/local/sbin /usr/local/bin
        /usr/sbin /usr/bin
        /sbin /bin
    )

    # macOS uses path_helper to add other paths from other apps
    if [[ -x /usr/libexec/path_helper ]]; then
        path=()
        eval "$(/usr/libexec/path_helper -s)"
    fi

    current_path=($path)
    path=()

    for p in $current_path; do
        p=${p:A}
        [[ ${desired[(r)$p]} ]] || {
            _bt_suffix_path $p
        }
    done

    for p in $desired; do
        p=${p:A}
        _bt_suffix_path $p
    done
} && __
