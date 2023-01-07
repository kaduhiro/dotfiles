#!/bin/sh
[ "$OSNAME" = 'macos' ]

# Source Code Pro for Powerline fonts
if ! find /Library/Fonts -name 'Source Code Pro for Powerline.otf'; then
	git clone --depth=1 https://github.com/powerline/fonts.git
	cd fonts
	./install.sh
	cd -
	rm -rf fonts
fi
