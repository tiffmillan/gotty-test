#!/bin/bash

# Menjalankan Gotty dengan perintah khusus di latar belakang
./gotty -w bash &

# Menunggu beberapa saat untuk memastikan Gotty telah dimulai (opsional)
sleep 5

# Menjalankan Ngrok di latar belakang tanpa menunggu
./ngrok http http://localhost:8080 &
