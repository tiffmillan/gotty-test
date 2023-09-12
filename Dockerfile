# Gunakan gambar Debian Buster sebagai dasar
FROM debian:buster

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Copy kalau gk tau copy ini tuh sama kayak lu ngoding cuman kopas doang
COPY . .

# Nah ini biar dapet izin doang, pelit soal nya
RUN chmod +x ngrok.sh

# CMD untuk menjalankan skrip ngrok.sh
CMD ./ngrok.sh
