FROM ubuntu:focal-20200925

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y virtualbox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# /usr/local/bin is before /usr/bin in PATH, so the wrapper will be picked up
# first (before the original binary)
COPY vboxmanage.wrapper /usr/local/bin/vboxmanage
