# Gunakan gambar Debian Buster sebagai dasar
FROM debian:buster

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Instal Curl untuk mendownload Gotty
RUN apt-get install -y curl

# Download Gotty dari sumber resmi
RUN curl -sSLo gotty https://github.com/yudai/gotty/releases/download/v2.0.0/gotty_linux_amd64.tar.gz

# Ekstrak dan beri izin eksekusi pada Gotty
RUN tar -xzvf gotty_linux_amd64.tar.gz && chmod +x gotty && mv gotty /usr/bin/

# CMD untuk menjalankan Gotty dengan shell bash
CMD gotty -w bash
