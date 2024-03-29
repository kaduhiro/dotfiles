#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

if type tmux; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if type pip3; then
	# Powerline
	pip3 install powerline-status
fi
