# Use the base image Debian
FROM debian
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git curl -y

# Install SSH server
RUN apt-get install -y openssh-server

# Add configuration for the 'railway' user (replace '123' with your desired password)
RUN useradd -m railway && echo "railway:123" | chpasswd

# Install unzip to extract ngrok
RUN apt-get install -y unzip

# Download and install Ngrok (example with Linux 64-bit version)
RUN curl -o ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
    unzip ngrok.zip -d /usr/local/bin && \
    rm ngrok.zip

# Configure Ngrok (replace 'your_ngrok_auth_token' with your authentication token)
RUN ngrok authtoken 2UXIkrPTqCqnpGhGX7de85J22aj_38yxFQgi3GhnC23Qn2Cpn

# Expose SSH port (22) if needed
EXPOSE 22

# jadi
RUN service ssh start

# Start the SSH service
CMD ["ngrok", "tcp", "22"]
