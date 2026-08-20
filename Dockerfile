FROM archlinux/archlinux:latest AS builder

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git

RUN useradd -m builder && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    sed -i '/^OPTIONS/s/ debug/ !debug/' /etc/makepkg.conf && \
    su - builder -c 'git clone https://aur.archlinux.org/paru.git && cd paru && makepkg --syncdeps --noconfirm'


FROM archlinux/archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo && \
    pacman -Scc --noconfirm

RUN --mount=type=bind,from=builder,source=/home/builder/paru,target=/tmp/paru \
    pacman -U /tmp/paru/*.pkg.tar.zst --noconfirm && \
    yes | paru -Scc

# Placed last so it doesn't invalidate the cache for the RUN layers above when
# VERSION changes between the hash-resolving build and the labeled push.
ARG VERSION
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.source=https://github.com/its-me/image.archlinux
LABEL org.opencontainers.image.title="archlinux"
LABEL org.opencontainers.image.description="Arch Linux image with paru (AUR helper) installed"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.authors="Sergey Kanafyev <sergeykanafyev@gmail.com>"
