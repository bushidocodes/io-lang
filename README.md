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

## Script compatibility

The Docker image builds a WASM (WASI) Io binary. Optional C addons such as
`Random` and `URL`/`Socket` are not compiled in. Scripts that depend on those
addons are noted below.

| Script | Runnable | Notes |
|--------|----------|-------|
| `actors.io` | ✅ | |
| `animals.io` | ✅ | |
| `comparisonsAndCompounds.io` | ✅ | |
| `controlStructures.io` | ✅ | |
| `coroutine.io` | ✅ | |
| `fibonacci.io` | ✅ | |
| `guessingGame.io` | ✅ | Uses `Date`-based seed (original `Random` addon unavailable) |
| `helloWorld.io` | ✅ | |
| `hw1.io` | ✅ | |
| `lists.io` | ✅ | |
| `lispML.io` | ✅ | |
| `maps.io` | ✅ | |
| `matrix.io` | ✅ | |
| `messages.io` | ✅ | |
| `myAverage.io` | ✅ | |
| `operators.io` | ✅ | |
| `phonebook.io` | ✅ | |
| `singletons.io` | ✅ | |
| `sum2DArray.io` | ✅ | |
| `vehicles.io` | ✅ | |
| `webFetch.io` | ⚠️ | `URL` addon unavailable in WASM build; code is commented out with explanation |
| `zeroDenominator.io` | ✅ | |

## Notes

Io now uses a WebAssembly (WASI) build system. The Docker image builds Io from source at
[github.com/IoLanguage/io](https://github.com/IoLanguage/io) using wasi-sdk and wasmtime.
If the wasi-sdk release in the Dockerfile is outdated, update the version number to match
the latest release at https://github.com/WebAssembly/wasi-sdk/releases.
