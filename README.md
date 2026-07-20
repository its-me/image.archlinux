# arch-linux

Arch Linux container images with [paru](https://github.com/Morganamilo/paru) AUR helper pre-installed, built and published daily.

## Images

### Base (`latest`)

Minimal Arch Linux image with paru. Intended as a foundation for other images.

```
docker pull ghcr.io/its-me/archlinux:latest
```

### Builder (`builder`)

Extends the base image with AUR build tools and a passwordless `builder` user for running `makepkg` and `paru`.

```
docker pull ghcr.io/its-me/archlinux:builder
```

Includes: `base-devel`, `github-cli`, `jq`, `namcap`, `openssh`, `rsync`

## Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest base image |
| `YYMMDD` | Date-stamped base image |
| `builder` | Latest builder image |
| `builder-YYMMDD` | Date-stamped builder image |

## Registries

| Registry | Image |
|----------|-------|
| Docker Hub | `1tsme/archlinux` |
| Quay | `quay.io/1tsme/archlinux` |
| GHCR | `ghcr.io/its-me/archlinux` |

## License

[MIT](LICENSE)
