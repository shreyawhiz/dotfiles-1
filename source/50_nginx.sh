export NGINX_DIR

if [ "$OSTYPE" =~ ^darwin ]; then
  NGINX_DIR="/usr/local/etc/nginx"
  alias nstart="sudo ${NGINX_DIR}/sbin/nginx"
  alias nstop='sudo kill `cat ${NGINX_DIR}/logs/nginx.pid`'
fi

if [ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]; then
  NGINX_DIR="/etc/nginx"
  alias nstart="sudo service start nginx"
  alias nstop="sudo service stop nginx"
fi

alias nedit="vim ${NGINX_DIR}/sites-available"
alias nrestart="nstop && nstart"

sites_available=$NGINX_DIR/sites-available
sites_enabled=$NGINX_DIR/sites-enabled

# Enables a site configuration
function nensite() {
  if [ -f "$sites_enabled/$1" ]; then
    echo "The site \"$1\" is already enabled"
    return 1
  fi

  if [ -f "$sites_available/$1" ]; then
    ln -s "$sites_available/$1" "$sites_enabled/$1"
    echo "Added site \"$1\""
  else
    echo "No site file by the name of \"$1\" exists in $sites_available"
  fi
}

# Disables a site configuration
function ndissite() {
  if [ ! -f $sites_available/$1 ]; then
    echo "No site file by the name of \"$1\" exists in $sites_available"
    return 1
  fi

  if [ -f $sites_enabled/$1 ]; then
    rm $sites_enabled/$1
    echo "Removed site \"$1\""
  else
    echo "The site \"$1\" is not currently enabled"
  fi
}
