# Gunakan gambar Debian Buster sebagai dasar - mau ubuntu atau debian? sama saja
FROM ubuntu:latest

# Update dan upgrade paket-paket sistem
RUN apt-get update && apt-get upgrade -y

# Copy kalau gk tau copy ini tuh sama kayak lu ngoding cuman kopas doang
COPY . .

# susah kalo ubuntu
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
RUN nvm install 18.17.0  # Atau versi Node.js yang sesuai

# Bjir lahhhhhh
RUN apt-get install apt-utils -y

# Menjalankan Ngrok dengan token yang telah disetel
RUN ./ngrok authtoken 2VIxGn1iB9vSlFSHFhfc7gGQUAV_566u6yhqcykzuETbRf4Fw

# Nah ini biar dapet izin doang, pelit soal nya
RUN chmod +x ngrok.sh

# CMD untuk menjalankan skrip ngrok.sh
CMD ./ngrok.sh
