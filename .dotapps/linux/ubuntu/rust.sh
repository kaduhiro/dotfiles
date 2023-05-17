#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

if ! type rustc; then
	sudo apt-get install -y rust-all
fi
