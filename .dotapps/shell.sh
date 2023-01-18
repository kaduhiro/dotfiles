#!/bin/sh

if ! type zsh; then
	case "$OSDIST" in
		ubuntu)
			sudo apt install -y zsh
			;;
	esac
fi
