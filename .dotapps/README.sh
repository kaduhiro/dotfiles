#!/bin/sh
[ "$OSNAME" = '' ]
[ "$OSDIST" = '' ]
[[ "$OSVERSION" =~ ^1\. ]]
[ "$OSARCH" = '' ]
[ "$OSSHELL" = '' ]

cat <<- EOF
README:

OSNAME    windows linux macos
OSDIST    ubuntu centos amazonlinux
OSVERSION 22.04 12.6
OSARCH    i386 x86_64 arm64
OSSHELL   bash zsh
EOF
