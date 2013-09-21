set -U NGINX_DIR

if [ (uname -s) = 'Darwin' ]
  set NGINX_DIR /usr/local/etc/nginx
  alias nstart "sudo $NGINX_DIR/sbin/nginx"
  alias nstop "sudo kill (cat $NGINX_DIR/logs/nginx.pid)"
end

if cat /etc/issue ^ /dev/null | grep '^Ubuntu' > /dev/null
  set NGINX_DIR /etc/nginx
  alias nstart 'sudo service start nginx'
  alias nstop 'sudo service stop nginx'
end

alias nedit "vim $NGINX_DIR/sites-available"
alias nrestart 'nstop and nstart'

set -l sites_available $NGINX_DIR/sites-available
set -l sites_enabled $NGINX_DIR/sites-enabled

# Enables a site configuration
function nensite
  if [ -f "$sites_enabled/$1" ]
    echo "The site \"$1\" is already enabled"
    return 1
  end

  if [ -f "$sites_available/$1" ]
    ln -s "$sites_available/$1" "$sites_enabled/$1"
    echo "Added site \"$1\""
  else
    echo "No site file by the name of \"$1\" exists in $sites_available"
end
end

# Disables a site configuration
function ndissite
  if [ ! -f $sites_available/$1 ]
    echo "No site file by the name of \"$1\" exists in $sites_available"
    return 1
  end

  if [ -f $sites_enabled/$1 ]
    rm "$sites_enabled/$1"
    echo "Removed site \"$1\""
  else
    echo "The site \"$1\" is not currently enabled"
  end
end
