#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'debian' ]

if ! type docker; then
	curl -sSL https://get.docker.com | sh

	sudo usermod -aG docker $USER
	sudo mkdir -p /home/docker
	sudo chown root.docker /home/docker
	sudo chmod 2770 /home/docker
fi
