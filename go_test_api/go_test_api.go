// App go_test_api_block
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", rootHandler)

	err := http.ListenAndServe(":9001", nil)
	if err != nil {
		panic(err)
	}
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Go - Hello World</h1>")
}

// func startHttpServer(wg *sync.WaitGroup) *http.Server {
//     srv := &http.Server{Addr: ":9001"}

//     http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
//         io.WriteString(w, "hello world\n")
//     })

//     go func() {
//         defer wg.Done() // let main know we are done cleaning up

//         // always returns error. ErrServerClosed on graceful close
//         if err := srv.ListenAndServe(); err != http.ErrServerClosed {
//             // unexpected error. port in use?
//             log.Fatalf("ListenAndServe(): %v", err)
//         }
//     }()

//     // returning reference so caller can call Shutdown()
//     return srv
// }

// func main() {
//     log.Printf("main: starting HTTP server")

//     httpServerExitDone := &sync.WaitGroup{}

//     httpServerExitDone.Add(1)
//     srv := startHttpServer(httpServerExitDone)

//     log.Printf("main: serving for 10 seconds")

//     // time.Sleep(10 * time.Second)

//     log.Printf("main: stopping HTTP server")

//     // now close the server gracefully ("shutdown")
//     // timeout could be given with a proper context
//     // (in real world you shouldn't use TODO()).
//     if err := srv.Shutdown(context.TODO()); err != nil {
//         panic(err) // failure/timeout shutting down the server gracefully
//     }

//     // wait for goroutine started in startHttpServer() to stop
//     httpServerExitDone.Wait()

//     log.Printf("main: done. exiting")
// }
