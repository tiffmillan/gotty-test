# Gunakan base image Debian
FROM debian
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
# Tambahkan perintah lain yang Anda butuhkan untuk konfigurasi Debian
