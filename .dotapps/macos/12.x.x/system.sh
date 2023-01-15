#!/bin/sh
[ "$OSNAME" = 'macos' ]
[[ "$OSVERSION" =~ ^12\. ]]

scripts=(
general
finder
keyboard
trackpad
)

dir=$(dirname "$0")

for script in ${scripts[@]}; do
	/bin/sh -eu $dir/$script
done

killall Finder
