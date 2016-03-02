DOCKER_ENV="$HOME/.dockerenv"
DOCKER_MACHINE_NAME="default"

# Docker environment helpers

dclean() {
  docker rm -v $(docker ps --filter status=exited -q 2> /dev/null) 2> /dev/null
  docker rmi $(docker images --filter dangling=true -q 2> /dev/null) 2> /dev/null
}

denv() {
  eval "$(cat "$DOCKER_ENV")"
}

dstart() {
  docker-machine start $DOCKER_MACHINE_NAME
  docker-machine env "$DOCKER_MACHINE_NAME" > "$DOCKER_ENV"
  denv
}

dstop() {
  docker-machine stop $DOCKER_MACHINE_NAME
  rm "$HOME/.dockerenv"
}

# Docker executables

alpine() {
  docker run --rm -it bentruyman/alpine "$@"
}

dshell() {
  if [ -z "$@" ]; then
    echo "An image name must be specified"
    return 1;
  fi
  docker run --rm -it "$@" sh
}

iex() {
  docker run --rm -it \
    -v "$(pwd)":/data/app \
    -v "$HOME/.hex":/root/.hex \
    -v "$HOME/.mix":/root/.mix \
    -w /data/app \
    bentruyman/elixir-phoenix-dev iex "$@"
}

mix() {
  docker run --rm -it \
    -v "$(pwd)":/data/app \
    -v "$HOME/.hex":/root/.hex \
    -v "$HOME/.mix":/root/.mix \
    -w /data/app \
    bentruyman/elixir-phoenix-dev mix "$@"
}

# Initialize Docker environment if one exists

if [[ -f $DOCKER_ENV ]]; then
  denv
fi

# Docker command helpers

alpine() {
  docker run --rm -it bentruyman/alpine "$@"
}

iex() {
  docker run --rm -it \
    -v "$(pwd)":/data/app \
    -v "$HOME/.hex":/root/.hex \
    -v "$HOME/.mix":/root/.mix \
    -w /data/app \
    bentruyman/elixir-phoenix-dev iex "$@"
}

mix() {
  docker run --rm -it \
    -v "$(pwd)":/data/app \
    -v "$HOME/.hex":/root/.hex \
    -v "$HOME/.mix":/root/.mix \
    -w /data/app \
    bentruyman/elixir-phoenix-dev mix "$@"
}
