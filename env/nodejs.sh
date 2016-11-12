NODE_VERSION=6.7.0

if [[ $(uname -s) = 'Darwin' ]]; then
  export NVM_DIR="$HOME/.nvm"
fi

alias npmp='npm --always-auth false --registry https://registry.npmjs.com'

n() {
  nvm use default
}

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

npm-stable() {
  npms $argv | grep -E '201[5|6]-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
}

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# export PATH="${PATH}:${NVM_DIR}/versions/node/${NODE_VERSION}/bin"
