#!/bin/sh
[ "$OSNAME" = 'linux' ]

if ! type docker; then
	printf '? install docker (y/N) ' && read yn
	if [ "$yn" = 'y' ]; then
		# [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

		# Add Docker's official GPG key:
		sudo apt-get update
		sudo apt-get install ca-certificates curl
		sudo install -m 0755 -d /etc/apt/keyrings
		sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
		sudo chmod a+r /etc/apt/keyrings/docker.asc

		# Add the repository to Apt sources:
		echo \
			"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
			$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
		sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		sudo apt-get update

		# Install packages for Docker
		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

		# Enable docker command
		if ! id -nG | grep -qw docker; then
			sudo usermod -a -G docker $USER
			echo '! Re-login is required to apply'
		fi
	fi

	# Standalone
	# usage: docker-compose
	# if ! docker-compose --version; then
	#   sudo curl -SL https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	#   sudo chmod +x /usr/local/bin/docker-compose
	# fi

	# Plugin
	# usage: docker compose
	# if ! docker compose --version; then
	# 	mkdir -p ~/.docker/cli-plugins/
	# 	curl -SL https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m) -o ~/.docker/cli-plugins/docker-compose
	# 	chmod +x ~/.docker/cli-plugins/docker-compose
	# fi
fi
