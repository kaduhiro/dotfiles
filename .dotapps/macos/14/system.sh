#!/bin/sh
[ "$OSNAME" = 'macos' ]
[[ "$OSVERSION" =~ ^14\. ]]

scripts=(
general
finder
dock
keyboard
trackpad
)

dir=$(dirname "$0")

for script in ${scripts[@]}; do
	/bin/sh -eu $dir/$script
done

killall Finder
killall Dock
