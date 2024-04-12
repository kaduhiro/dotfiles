#!/bin/sh
[ "$OSNAME" = 'macos' ]

# install Homebrew
if ! command brew; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	export PATH=$PATH:/opt/homebrew/bin
fi

# install applications
cd
brew bundle
cd -
