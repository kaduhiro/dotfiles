#!/bin/sh
[ "$OSNAME" = 'linux' ]
[ "$OSDIST" = 'ubuntu' ]

if ! type nodejs; then
	NODE_MAJOR=20

	sudo apt-get update
	sudo apt-get install -y ca-certificates curl gnupg

	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
	echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

	sudo apt-get update
	sudo apt-get install -y nodejs
fi
