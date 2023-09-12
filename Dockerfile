# Gunakan gambar Debian Buster sebagai dasar
FROM debian:buster

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y
COPY . .

# CMD untuk menjalankan Gotty dengan shell bash
CMD ./gotty -w bash
