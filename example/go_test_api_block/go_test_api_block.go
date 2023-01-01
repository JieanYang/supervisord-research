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


