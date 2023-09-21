#!/bin/bash

# Install npm dengan opsi -y untuk menghindari konfirmasi tambahan
apt install npm -y

# Menginstal PM2 secara global menggunakan npm
npm install pm2 -g

# Memulai proses-proses yang didefinisikan dalam berkas konfigurasi pm2.json
pm2 start pm2.json

# Logss
# pm2 logs | Aktifkan Jika Perlu
