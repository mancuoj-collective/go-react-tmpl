package main

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
)

func main() {
	infoLog := log.New(os.Stdout, "INFO\t", log.Ldate|log.Ltime)
	errorLog := log.New(os.Stderr, "ERROR\t", log.Ldate|log.Ltime|log.Lshortfile)

	mux := http.NewServeMux()
	mux.HandleFunc("/", home)

	srv := &http.Server{
		Addr:     ":8888",
		ErrorLog: errorLog,
		Handler:  mux,
	}

	infoLog.Println("Starting server on http://localhost:8888")
	err := srv.ListenAndServe()
	errorLog.Fatal(err)
}

func home(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{"message": "Hello, World!"})
}
