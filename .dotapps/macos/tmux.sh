#!/bin/sh
[ "$OSNAME" = 'macos' ]

# Tmux Plugin Manager
if type tmux; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Powerline
if type pip3; then
	pip3 install powerline-status
fi
