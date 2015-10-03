DOCKER_ENV="$HOME/.dockerenv"
DOCKER_MACHINE_NAME="default"

denv() {
  eval "$(cat $DOCKER_ENV)"
}

dstart() {
  docker-machine start $DOCKER_MACHINE_NAME
  docker-machine env $DOCKER_MACHINE_NAME > $DOCKER_ENV
  denv
}

dstop() {
  docker-machine stop $DOCKER_MACHINE_NAME
  rm "$HOME/.dockerenv"
}

if [[ -f $DOCKER_ENV ]]; then
  denv
fi
