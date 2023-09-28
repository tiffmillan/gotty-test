#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Instal OpenSSH Server
apt install openssh-server -y

# Mulai SSH Server
systemctl restart ssh

# Instal sudo
apt install sudo -y
apt install apt-utils -y

# Buat pengguna yusup
useradd -m yusup

# Set kata sandi untuk pengguna yusup (909909)
echo "yusup:909909" | sudo chpasswd

# Tambahkan pengguna yusup ke grup sudo
sudo usermod -aG sudo yusup

# Masukkan token authtoken Ngrok Anda di sini
./ngrok authtoken 2W1KXuZUQObKBfAe6T3ZdN3KowU_5q6LRv3gaTCRPGrXMAtk9

# Jalankan Ngrok untuk SSH
./ngrok tcp 22
