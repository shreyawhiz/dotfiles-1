if [ $(uname -s) = 'Darwin' ]; then
  alias brewup='brew update && brew upgrade'
  alias dsstore='find . -name "*.DS_Store" -type f -ls -delete'
  alias o='open .'
fi
