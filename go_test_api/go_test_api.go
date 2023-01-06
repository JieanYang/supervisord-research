// App go_test_api_block
package main

import (
	"fmt"
	"net/http"
	"sync"
)

func main() {
	fmt.Println("Start main function - go_test_api.exe")
	wg := new(sync.WaitGroup)

	wg.Add(1)
	go func() {
		http.HandleFunc("/", rootHandler)

		err := http.ListenAndServe(":9001", nil)
		if err != nil {
			panic(err)
		}
		wg.Done()
	}()

	wg.Wait()
	fmt.Println("End main function - go_test_api.exe")
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Go - Hello World</h1>")
}
