FROM archlinux/archlinux:latest AS builder

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git

RUN useradd -m builder && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    sed -i '/^OPTIONS/s/ debug/ !debug/' /etc/makepkg.conf && \
    su - builder -c 'git clone https://aur.archlinux.org/paru.git && cd paru && makepkg --syncdeps --noconfirm'


FROM archlinux/archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -Scc --noconfirm

RUN --mount=type=bind,from=builder,source=/home/builder/paru,target=/tmp/paru \
    pacman -U /tmp/paru/*.pkg.tar.zst --noconfirm && \
    pacman -Scc --noconfirm
