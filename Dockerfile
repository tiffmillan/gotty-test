# Gunakan base image Debian
FROM debian
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git wget -y

# Instal SSH server
RUN apt-get install -y openssh-server

# Instal XRDP dan LXDE
RUN apt-get install -y xrdp lxde

# Unduh dan instal Ngrok (contoh dengan versi Linux 64-bit)
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin && \
    rm ngrok-stable-linux-amd64.zip

# Tambahkan konfigurasi passwd (ganti 'your_password' dengan kata sandi yang diinginkan)
RUN echo '909909' | passwd --stdin root

# Konfigurasi Ngrok (ganti 'your_ngrok_auth_token' dengan token autentikasi Anda)
RUN ngrok authtoken 2UXIkrPTqCqnpGhGX7de85J22aj_38yxFQgi3GhnC23Qn2Cpn

# Jalankan perintah untuk mengatur layanan SSH dan XRDP
RUN service ssh start && service xrdp start

# Expose port untuk XRDP jika diperlukan
EXPOSE 3389

# Jalankan Ngrok untuk meneruskan port 3389 (XRDP)
CMD ["sh", "-c", "ngrok tcp 3389 --region=us"]
