MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd -W):/src" -w //src io-lang io "$1"
