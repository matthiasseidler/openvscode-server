# Use a base image that has Python installed
FROM python:3.9-slim

# Install dependencies for VSCode server
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    wget \
    ca-certificates \
    libx11-dev \
    libxkbfile-dev \
    libsecret-1-dev \
    libnss3-dev \
    libgconf-2-4 \
    libxtst6 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libdbus-1-3 \
    libasound2 \
    libxcomposite1 \
    libxdamage1 \
    libgl1-mesa-glx \
    libgtk-3-0 \
    && apt-get clean

# Download and install VSCode Server (https://github.com/coder/code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set the working directory for the VSCode Server
WORKDIR /workspace

# Expose port for the VSCode Server (default 8080)
EXPOSE 8080

# Set environment variables (optional)
ENV PASSWORD=yourpassword # Set a password for VSCode server
ENV CODE_SERVER_VERSION=latest

# Command to run VSCode Server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password", "--password", "${PASSWORD}"]
