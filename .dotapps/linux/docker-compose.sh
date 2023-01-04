#!/bin/sh
[ "$OSNAME" = 'linux' ]

VERSION=v2.6.0

# standalone
# usage: docker-compose
if ! type docker-compose; then
  sudo curl -SL https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

# plugin
# usage: docker compose
# mkdir -p ~/.docker/cli-plugins/
# curl -SL https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m) -o ~/.docker/cli-plugins/docker-compose
# chmod +x ~/.docker/cli-plugins/docker-compose
