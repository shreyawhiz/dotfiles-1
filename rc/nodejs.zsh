__() {
    export NVM_DIR="$HOME/.nvm"
    local node_version="v6.9.5"

    alias n="nvm use $node_version"
    alias npmp="npm --always-auth false --registry https://registry.npmjs.com"

    npms() {
        npm search --registry=https://registry.npmjs.org "$@"
    }

    npm_stable() {
        npms "$@" | grep -E "201[5|6]-[0-9]{2}-[0-9]{2}" | grep -E "[1-9]+\.[0-9]+\.[0-9]+" | sed -e 's/ *$//'
    }

    # Load nvm
    [[ -s "$NVM_DIR/nvm.sh" ]] && {
        source $NVM_DIR/nvm.sh --no-use
        _bt_suffix_path "$NVM_DIR/versions/node/$node_version/bin"
    }
} && __
