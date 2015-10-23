export NVM_DIR="/usr/local/opt/nvm"

npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

npm-stable() {
  npms $argv | grep -E '2014-[0-9]{2}-[0-9]{2}' | grep -E '[1-9]+\.[0-9]+\.[0-9]+' | sed -e 's/ *$//'
}

nvm() {
  . "$NVM_DIR/nvm.sh"
  nvm $@
}
