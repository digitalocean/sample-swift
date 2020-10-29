import Swifter
import Dispatch

let server = HttpServer()
server["/assets/:path"] = shareFilesFromDirectory("assets")
server["/"] = scopes {
  html {
    body {
      center {
        img { src = "/assets/sammy.png" }
        h1 { inner = "Hello from Sammy the Shark!" }
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