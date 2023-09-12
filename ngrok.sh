#!/bin/bash

# Menjalankan Gotty dengan perintah khusus
./gotty -w bash

# Menunggu beberapa detik untuk memastikan Gotty sudah berjalan
sleep 5

# Memasukkan token Ngrok ke dalam variabel
NGROK_TOKEN="2BfdASj8NgWJ9EUqQjYiXzUQgW1_6EA3BmKK7SuHg7BHWeBqV"

# Menjalankan Ngrok dengan token yang telah disetel
ngrok authtoken "$NGROK_TOKEN"

# Mengarahkan ke Gotty
ngrok http http://localhost:8080
