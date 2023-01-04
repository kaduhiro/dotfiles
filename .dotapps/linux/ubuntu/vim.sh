#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

if type pip3; then
	# NeoVim
	pip3 install neovim
	# Powerline
	pip3 install powerline-status
fi
