FROM ghcr.io/its-me/archlinux:latest

RUN paru -Syu --noconfirm && \
    paru -S --noconfirm base-devel github-cli jq namcap openssh rsync && \
    yes | paru -Scc

RUN useradd -m builder && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/builder
