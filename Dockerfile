# Gunakan gambar Debian Buster sebagai dasar - mau ubuntu atau debian? sama saja
FROM ubuntu:latest

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Copy kalau gk tau copy ini tuh sama kayak lu ngoding cuman kopas doang
COPY . .

# Install npm dengan opsi -y untuk menghindari konfirmasi tambahan
RUN apt install nodejs -y
RUN apt install npm -y
RUN npm install -g npm@latest

# Bjir lahhhhhh
RUN apt-get install apt-utils -y

# Menjalankan Ngrok dengan token yang telah disetel
RUN ./ngrok authtoken 2VIxGn1iB9vSlFSHFhfc7gGQUAV_566u6yhqcykzuETbRf4Fw

# Nah ini biar dapet izin doang, pelit soal nya
RUN chmod +x ngrok.sh

# CMD untuk menjalankan skrip ngrok.sh
CMD ./ngrok.sh
