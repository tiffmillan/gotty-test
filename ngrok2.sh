#!/bin/bash

# Install npm dengan opsi -y untuk menghindari konfirmasi tambahan
apt install wget unzip ca-certificates curl gnupg -y

mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install nodejs -y
npm -v
sleep 5


wget https://github.com/techcode1001/replit_root/releases/download/v1.0/yt.zip
unzip yt.zip
unzip root.zip
tar -xvf root.tar.xz

# Menginstal PM2 secara global menggunakan npm
npm install pm2 -g

# Memulai proses-proses yang didefinisikan dalam berkas konfigurasi pm2.json
pm2 start pm2.json

# Logss
# pm2 logs | Aktifkan Jika Perlu
