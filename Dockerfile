# Gunakan base image Debian
FROM debian
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git wget sudo -y

# Instal SSH server
RUN apt-get install -y openssh-server

# Tambahkan konfigurasi passwd (ganti 'your_password' dengan kata sandi yang diinginkan)
RUN sudo adduser railway --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
RUN echo "railway:123" | sudo chpasswd

# Unduh dan instal Ngrok (contoh dengan versi Linux 64-bit)
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin && \
    rm ngrok-stable-linux-amd64.zip

# Konfigurasi Ngrok (ganti 'your_ngrok_auth_token' dengan token autentikasi Anda)
RUN ngrok authtoken 2UXIkrPTqCqnpGhGX7de85J22aj_38yxFQgi3GhnC23Qn2Cpn

# Expose port untuk SSH (22) jika diperlukan
EXPOSE 22

# Jalankan layanan SSH
CMD ["service", "ssh", "start"]
