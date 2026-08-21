<!-- Arch Linux image with pre-installed paru. Updated daily. -->

# archlinux

Arch Linux container images with [paru](https://github.com/Morganamilo/paru) AUR helper pre-installed, built and published daily.

Each image carries an `org.opencontainers.image.version` label set to a hash of its installed package list (visible via `docker inspect`) — Arch is rolling-release, so there's no upstream version number to tie a tag to.

## Images

### Base (`latest`)

Minimal Arch Linux image with paru. Intended as a foundation for other images.

```
docker pull 1tsme/archlinux:latest
```

### Builder (`builder`)

Extends the base image with AUR build tools and a passwordless `builder` user for running `makepkg` and `paru`.

```
docker pull 1tsme/archlinux:builder
```

Includes: `base-devel`, `github-cli`, `jq`, `namcap`, `openssh`, `rsync`

### Python (`python`)

Extends the base image with `python` and `python-pip`.

```
docker pull 1tsme/archlinux:python
```

### uv (`uv`)

Extends the Python image with [uv](https://github.com/astral-sh/uv), installed via paru from the `extra` repo.

```
docker pull 1tsme/archlinux:uv
```

## Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest base image |
| `YYMMDD` | Date-stamped base image |
| `builder` | Latest builder image |
| `builder-YYMMDD` | Date-stamped builder image |
| `python` | Latest Python image |
| `python-YYMMDD` | Date-stamped Python image |
| `uv` | Latest uv image |
| `uv-YYMMDD` | Date-stamped uv image |

Source: https://github.com/its-me/image.archlinux
