#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" == MINGW* ]] || [[ "$(uname -s)" == MSYS* ]] || [[ "${OSTYPE:-}" == "msys" ]]; then
    MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd -W):/src" -w //src io-lang io "$1"
else
    docker run --rm -v "$PWD:/src" -w /src io-lang io "$1"
fi
