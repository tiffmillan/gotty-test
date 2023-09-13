# Gunakan gambar Debian Buster sebagai dasar
FROM debian:buster

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Copy kalau gk tau copy ini tuh sama kayak lu ngoding cuman kopas doang
COPY . .

# Menjalankan Ngrok dengan token yang telah disetel
RUN ./ngrok authtoken 2VIxGn1iB9vSlFSHFhfc7gGQUAV_566u6yhqcykzuETbRf4Fw

# Nah ini biar dapet izin doang, pelit soal nya
RUN chmod +x ngrok.sh
RUN chmod +x runss.sh

# CMD untuk menjalankan skrip ngrok.sh
CMD ./runss.sh
