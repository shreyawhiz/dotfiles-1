__() {
  export NVM_DIR="$HOME/.nvm"

  alias npmp="npm --always-auth false --registry https://registry.npmjs.com"

  npms() {
    npm search --registry=https://registry.npmjs.org "$@"
  }

  npm_stable() {
    npms "$@" | grep -E "201[5|6]-[0-9]{2}-[0-9]{2}" | grep -E "[1-9]+\.[0-9]+\.[0-9]+" | sed -e 's/ *$//'
  }

  yarng() {
    local global_packages=(
      cost-of-modules
      eslint
      eslint-config-semistandard
      eslint-config-standard
      eslint-plugin-promise
      eslint-plugin-standard
      vtop
    )

    yarn global add ${global_packages}
  }

  # Load nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && {
    source $NVM_DIR/nvm.sh --no-use
  }

  # Add global yarn bin to $PATH
  (( $+commands[yarn] )) && {
    _bt_prefix_path $(yarn global bin)
  }
} && __
