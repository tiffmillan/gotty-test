# Gunakan gambar Debian Buster sebagai dasar
FROM debian:buster

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Copy kalau gk tau copy ini tuh sama kayak lu ngoding cuman kopas doang
COPY . .

# Menjalankan Ngrok dengan token yang telah disetel
RUN ./ngrok authtoken 2BfdASj8NgWJ9EUqQjYiXzUQgW1_6EA3BmKK7SuHg7BHWeBqV

# Nah ini biar dapet izin doang, pelit soal nya
RUN chmod +x ngrok.sh

# CMD untuk menjalankan skrip ngrok.sh
CMD ./ngrok.sh
