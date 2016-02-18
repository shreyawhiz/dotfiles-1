# Docker command helpers

alpine() {
  docker run --rm -it bentruyman/alpine "$@"
}

iex() {
  docker run --rm -it \
    -v $(pwd):/data/app \
    -v $HOME/.hex:/root/.hex \
    -v $HOME/.mix:/root/.mix \
    -w /data/app \
    bentruyman/elixir-phoenix-dev iex "$@"
}

mix() {
  docker run --rm -it \
    -v $(pwd):/data/app \
    -v $HOME/.hex:/root/.hex \
    -v $HOME/.mix:/root/.mix \
    -w /data/app \
    bentruyman/elixir-phoenix-dev mix "$@"
}
