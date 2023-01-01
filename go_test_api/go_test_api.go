// App go_test_api_block
package main

import (
	"fmt"
	"net/http"
	"sync"
)

func main() {
	wg := new(sync.WaitGroup)

	wg.Add(1)
	go func() {
		http.HandleFunc("/", rootHandler)

		wg.Done()
		err := http.ListenAndServe(":9001", nil)
		if err != nil {
			panic(err)
		}
	}()

	wg.Wait()
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Go - Hello World</h1>")
}
