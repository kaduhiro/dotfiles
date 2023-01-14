#!/bin/sh
[ "$OSNAME" = 'macos' ]
[ "$OSSHELL" = 'zsh' ]

# zsh-completions
chmod 0755 $(brew --prefix)/share
chmod 0755 $(brew --prefix)/share/zsh
chmod 0755 $(brew --prefix)/share/zsh/site-functions
