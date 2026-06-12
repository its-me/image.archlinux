FROM ghcr.io/its-me/arch-linux:latest

RUN paru -Syu --noconfirm && \
    paru -S --noconfirm base-devel github-cli jq namcap openssh && \
    yes | paru -Scc

RUN useradd -m builder && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/builder
