(( $+commands[docker] )) && {
    dclean() {
        docker rm -v $(docker ps --filter status=exited -q 2> /dev/null) 2> /dev/null
        docker rmi $(docker images --filter dangling=true -q 2> /dev/null) 2> /dev/null
    }

    alpine() {
        docker run --rm -it bentruyman/alpine "$@"
    }

    dshell() {
        if [ -z "$1" ]; then
            echo "An image name must be specified"
            return 1;
        fi

        docker run --rm -it "$1" sh
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
}
