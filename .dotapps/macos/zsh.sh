#!/bin/sh
[ "$OSNAME" = 'macos' ]
[ "$OSSHELL" = 'zsh' ]

[ $SHELL = $(which zsh) ] && [ -d ~/.zplug ] && exit 1

# zsh
if [ $SHELL != $(which zsh) ]; then
	sudo chsh $USER -s $(which zsh)
fi

# zplug
if [ ! -d ~/.zplug ]; then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
