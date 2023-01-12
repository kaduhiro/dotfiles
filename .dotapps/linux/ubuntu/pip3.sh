#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

if ! type pip3; then
	sudo apt install -y python3-pip
fi
