#!/bin/sh
[ "$OSNAME" = 'macos' ]
[[ "$OSVERSION" =~ ^26\. ]]

scripts=(
general
finder
dock
controlcenter
keyboard
trackpad
)

dir=$(dirname "$0")

# TODO: activate after hands-on
# for script in ${scripts[@]}; do
# 	/bin/sh -eu $dir/$script
# done
# 
# killall Finder
# killall Dock
