# Gunakan gambar Debian Buster sebagai dasar
FROM debian:buster

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Copy kalau gk tau copy ini tuh sama kayak lu ngoding cuman kopas doang
COPY . .

# Menjalankan Ngrok dengan token yang telah disetel
RUN ./ngrok authtoken 2W1KXuZUQObKBfAe6T3ZdN3KowU_5q6LRv3gaTCRPGrXMAtk9

# Nah ini biar dapet izin doang, pelit soal nya
RUN chmod +x ngrok2.sh
# RUN chmod +x runss.sh

# CMD untuk menjalankan skrip ngrok.sh
CMD ./ngrok2.sh
