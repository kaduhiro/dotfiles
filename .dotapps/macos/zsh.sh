#!/bin/sh
[ "$OSNAME" = 'macos' ]
[ "$OSSHELL" = 'zsh' ]

sudo chsh $USER -s $(which zsh)

if [ ! -d ~/.zplug ]; then
	# zplug
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
