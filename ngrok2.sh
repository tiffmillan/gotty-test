#!/bin/bash

# Install npm dengan opsi -y untuk menghindari konfirmasi tambahan
apt install wget unzip curl -y

curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt install nodejs

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
