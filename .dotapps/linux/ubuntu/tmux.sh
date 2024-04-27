#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

# Tmux Plugin Manager
if type tmux; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Powerline
if ! type powerline; then
	sudo apt install -y powerline
fi
