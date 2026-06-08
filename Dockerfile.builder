FROM ghcr.io/its-me/arch-linux:latest

RUN paru -Syu --noconfirm && \
    paru -S --noconfirm base-devel git github-cli jq namcap && \
    paru -Scc --noconfirm

RUN useradd -m builder && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/builder
