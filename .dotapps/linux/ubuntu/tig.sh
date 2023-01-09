#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

if ! type tig; then
	sudo apt install -y tig
fi
