if [ -f ~/.ssh/id_rsa ]
  ssh-add ~/.ssh/id_rsa ^ /dev/null
end

if [ -f ~/.ssh/id_dsa ]
  ssh-add ~/.ssh/id_dsa ^ /dev/null
end
