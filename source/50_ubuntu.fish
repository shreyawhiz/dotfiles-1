if cat /etc/issue ^ /dev/null | grep '^Ubuntu' > /dev/null
  exit 1
end
