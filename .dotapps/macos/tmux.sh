#!/bin/sh
[ "$OSNAME" = 'macos' ]

# Tmux Plugin Manager
if type tmux >/dev/null; then
	if [ ! -d ~/.tmux/plugins/tpm ]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
fi

# Powerline
if type pip3 >/dev/null; then
	if ! pip3 show powerline-status >/dev/null; then
		pip3 install powerline-status
	fi
fi
