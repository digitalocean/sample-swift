import Swifter
import Dispatch

let server = HttpServer()
server["/"] = scopes {
  html {
    body {
      center {
        h1 { inner = "hello, world!" }
      }
    }
  }
}
server["/files/:path"] = directoryBrowser("/")

let semaphore = DispatchSemaphore(value: 0)
do {
  try server.start(8080, forceIPv4: true)
  print("The magic is happening on port: \(try server.port()). Visit http://localhost:8080")
  semaphore.wait()
} catch {
  print("Error starting server: \(error)")
  semaphore.signal()
}