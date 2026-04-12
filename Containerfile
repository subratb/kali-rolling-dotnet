FROM kalilinux/kali-rolling

# Install dependencies
RUN apt update && \
    apt install -y wget curl libicu-dev && \
    apt clean

# Download dotnet-install script
RUN wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh && \
    chmod +x /tmp/dotnet-install.sh

# Install latest LTS .NET SDK
RUN /tmp/dotnet-install.sh --version latest

# Add dotnet to PATH
ENV DOTNET_ROOT=/root/.dotnet
ENV PATH="$PATH:/root/.dotnet:/root/.dotnet/tools"

# Verify installation
RUN dotnet --info

CMD ["/bin/bash"]