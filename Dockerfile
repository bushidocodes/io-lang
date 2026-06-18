FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    git \
    make \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Install wasi-sdk (provides the WASM compiler toolchain)
RUN curl -L https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-33/wasi-sdk-33.0-x86_64-linux.tar.gz \
    | tar xz -C /opt \
    && ln -s /opt/wasi-sdk-33.0-x86_64-linux /opt/wasi-sdk

# Install wasmtime (the WASM runtime that executes Io programs)
RUN curl https://wasmtime.dev/install.sh -sSf | bash
ENV PATH="/root/.wasmtime/bin:$PATH"

# Build Io from source (rewrite SSH submodule URLs to HTTPS so no SSH key is needed)
# Patch: newer clang (wasi-sdk 22+) treats -Wincompatible-pointer-types as an error;
# suppress it so IoFile.c builds cleanly.
RUN git config --global url."https://github.com/".insteadOf "git@github.com:" \
    && git clone --recursive https://github.com/IoLanguage/io.git /io \
    && cd /io \
    && sed -i 's/-fno-exceptions/-fno-exceptions -Wno-error=incompatible-pointer-types/' Makefile \
    && make WASI_SDK=/opt/wasi-sdk

ENV PATH="/io/build/bin:$PATH"

# Wrapper so callers can use `io script.io` instead of the full wasmtime invocation
RUN printf '#!/bin/sh\nexec wasmtime --dir=. /io/build/bin/io_static "$@"\n' > /usr/local/bin/io \
    && chmod +x /usr/local/bin/io
