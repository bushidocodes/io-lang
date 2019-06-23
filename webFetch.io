futureResult := URL with("https://bushido.codes/") @fetch

writeln("Do something immediately while fetch goes on in the background...")
writeln("This will block until the result is available.")
writeln("fetched ", futureResult size, " bytes")