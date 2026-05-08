#!/bin/sh

type zsh >/dev/null && exit 1

case "$OSDIST" in
	ubuntu)
		sudo apt install -y zsh
		;;
esac
