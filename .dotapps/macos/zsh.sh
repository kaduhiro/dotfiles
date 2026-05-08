#!/bin/sh
[ "$OSNAME" = 'macos' ]
[ "$OSSHELL" = 'zsh' ]

if [ "$SHELL" != '/bin/zsh' ]; then
	sudo chsh $USER -s $(which zsh)
fi

if [ ! -d ~/.zplug ]; then
	# zplug
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
