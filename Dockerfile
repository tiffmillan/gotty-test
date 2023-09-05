# Use the base image Debian
FROM debian
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git wget -y

# Install SSH server
RUN apt-get install -y openssh-server

# Add configuration for the 'railway' user (replace '123' with your desired password)
RUN useradd -m railway && echo "railway:123" | chpasswd

# Download and install Ngrok (example with Linux 64-bit version)
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin && \
    rm ngrok-stable-linux-amd64.zip

# Configure Ngrok (replace 'your_ngrok_auth_token' with your authentication token)
RUN ngrok authtoken 2UXIkrPTqCqnpGhGX7de85J22aj_38yxFQgi3GhnC23Qn2Cpn

# Expose SSH port (22) if needed
EXPOSE 22

# Start the SSH service
CMD ["service", "ssh", "start"]
