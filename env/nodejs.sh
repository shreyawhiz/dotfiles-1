if [[ $(uname -s) = 'Darwin' ]]; then
  export NVM_DIR="/usr/local/opt/nvm"
else
  export NVM_DIR="$HOME/.nvm"
fi

alias npmp='npm --always-auth false --registry https://registry.npmjs.com'

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

npm-stable() {
  npms $argv | grep -E '201[5|6]-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
}
