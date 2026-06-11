// NOTE: The URL addon (and its Socket dependency) are not compiled into the
// WASM Io build produced by this repo's Dockerfile. Running this file will
// produce: Exception: Object does not respond to 'URL'
//
// To run this example, build a native (non-WASM) Io binary with the URL addon
// enabled, or use an Io distribution that includes it.
//
// What this code demonstrates:
//   @fetch sends the message asynchronously and returns a Future immediately.
//   Io continues past that line while the fetch runs in the background.
//   Accessing futureResult size blocks until the result arrives — this is
//   Io's built-in lazy future / actor semantics with no extra syntax.

// futureResult := URL with("https://bushido.codes/") @fetch
//
// writeln("Do something immediately while fetch goes on in the background...")
// writeln("This will block until the result is available.")
// writeln("fetched ", futureResult size, " bytes")

writeln("webFetch.io: URL addon not available in the WASM build — see comments above.")
