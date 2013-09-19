if [ -f ~/.ssh/id_rsa ]; then
  ssh-add ~/.ssh/id_rsa &>/dev/null
fi

if [ -f ~/.ssh/id_dsa ]; then
  ssh-add ~/.ssh/id_dsa &>/dev/null
fi

