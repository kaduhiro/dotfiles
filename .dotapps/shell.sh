#!/bin/sh

if ! type zsh >/dev/null; then
	case "$OSDIST" in
		ubuntu)
			sudo apt install -y zsh
			;;
	esac
fi
