#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

if ! id -nG | grep -qw sudoer; then
	printf '? are you sudoer (y/N) ' && read yn
	if [ "$yn" = 'y' ]; then
		sudo groupadd -g 10000 sudoer
		sudo usermod -a -G sudoer $USER
		cat <<- EOF | sudo tee -a /etc/sudoers.d/group
		%sudoer ALL=(ALL:ALL) NOPASSWD:ALL
		EOF
		echo '! Re-login is required to apply'
	fi
fi
