#!/bin/bash

# Menjalankan Gotty dengan perintah khusus
./gotty -w bash

# Mengarahkan ke Gotty
RUN ./ngrok http http://localhost:8080
