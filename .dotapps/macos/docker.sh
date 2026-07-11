#!/bin/sh
# [ "$OSNAME" = 'macos' ]
result=1

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
DOCKER_PLUGIN=$DOCKER_CONFIG/cli-plugins
mkdir -p $DOCKER_PLUGIN

OS=$(uname -s | tr '[:upper:]' '[:lower:]')

# Install Docker Compose plugin
# https://docs.docker.com/compose/install/linux/#install-the-plugin-manually
VERSION=$(curl -fsSL https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
if [ "$(docker compose version --short)" != "$VERSION" ]; then
  ARCH=
  case "$(uname -m)" in
    x86_64|amd64)
      ARCH=x86_64
      ;;
    arm64|aarch64)
      ARCH=aarch64
      ;;
    *)
      ;;
  esac
  URL="https://github.com/docker/compose/releases/download/v$VERSION/docker-compose-$OS-$ARCH"
  curl -SL $URL -o $DOCKER_PLUGIN/docker-compose
  chmod +x $DOCKER_PLUGIN/docker-compose
  result=0
fi

# Install Docker Buildx plugin
# https://github.com/docker/buildx/releases
VERSION=$(curl -fsSL https://api.github.com/repos/docker/buildx/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
if [ "$(docker buildx version --short)" != "$VERSION" ]; then
  ARCH=
  case "$(uname -m)" in
    x86_64|amd64)
      ARCH=amd64
      ;;
    arm64|aarch64)
      ARCH=arm64
      ;;
    *)
      ;;
  esac
  URL="https://github.com/docker/buildx/releases/download/v$VERSION/buildx-v$VERSION.$OS-$ARCH"
  curl -SL $URL -o $DOCKER_PLUGIN/docker-buildx
  chmod +x $DOCKER_PLUGIN/docker-buildx
  docker buildx install
  result=0
fi

# Create internal network
if ! docker network inspect internal >/dev/null; then
  docker network create internal
  result=0
fi

exit $result
