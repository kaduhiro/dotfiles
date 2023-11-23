#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'debian' ]

if ! type rustc; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
