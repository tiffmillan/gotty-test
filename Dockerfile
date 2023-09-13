# Gunakan gambar Debian Buster sebagai dasar - mau ubuntu atau debian? sama saja
FROM ubuntu:18.04

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Copy kalau gk tau copy ini tuh sama kayak lu ngoding cuman kopas doang
COPY . .

# Bjir lahhhhhh
RUN apt-get install apt-utils -y

# Menjalankan Ngrok dengan token yang telah disetel
RUN ./ngrok authtoken 2VIxGn1iB9vSlFSHFhfc7gGQUAV_566u6yhqcykzuETbRf4Fw

# Nah ini biar dapet izin doang, pelit soal nya
RUN chmod +x ngrok.sh

# CMD untuk menjalankan skrip ngrok.sh
CMD ./ngrok.sh
