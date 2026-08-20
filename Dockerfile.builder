FROM ghcr.io/its-me/archlinux:latest

RUN paru -Syu --noconfirm && \
    paru -S --noconfirm base-devel github-cli jq namcap openssh rsync && \
    yes | paru -Scc

RUN useradd -m builder && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/builder

# Placed last so it doesn't invalidate the cache for the RUN layers above when
# VERSION changes between the hash-resolving build and the labeled push.
ARG VERSION
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.source=https://github.com/its-me/image.archlinux
LABEL org.opencontainers.image.title="archlinux-builder"
LABEL org.opencontainers.image.description="Extends the archlinux image with base-devel, github-cli, jq, namcap, openssh, and rsync for AUR package building"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.authors="Sergey Kanafyev <sergeykanafyev@gmail.com>"
LABEL org.opencontainers.image.base.name="ghcr.io/its-me/archlinux:latest"
