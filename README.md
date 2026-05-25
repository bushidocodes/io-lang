# io-lang

Sample Io programming language programs.

## Running with Docker (recommended)

Build the image once:

```sh
docker build -t io-lang .
```

Run any `.io` file:

```sh
bash run.sh helloWorld.io
```

## Notes

Io now uses a WebAssembly (WASI) build system. The Docker image builds Io from source at
[github.com/IoLanguage/io](https://github.com/IoLanguage/io) using wasi-sdk and wasmtime.
If the wasi-sdk release in the Dockerfile is outdated, update the version number to match
the latest release at https://github.com/WebAssembly/wasi-sdk/releases.
