# Use an official Python image as a base
FROM python:3.9-slim

# Install dependencies required for VSCode Server
RUN apt-get update && apt-get install -y \
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

# Install code-server (VSCode server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set the working directory
WORKDIR /workspace

# Expose the port that VSCode Server will run on
EXPOSE 8080

# Set the default command to run code-server with password authentication
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "password"]
