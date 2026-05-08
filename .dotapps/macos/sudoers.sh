#!/bin/sh
[ "$OSNAME" = 'macos' ]

grep -Eq '^auth[ \t].*[ \t/]pam_reattach\.so$' /etc/pam.d/sudo_local && exit 1

# Enable sudo by Touch ID
# sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local

# Enable in tmux or screen (https://qiita.com/kawaz/items/0593163c1c5538a34f6f)
sh -c "$(curl -fsLS https://gist.githubusercontent.com/kawaz/d95fb3b547351e01f0f3f99783180b9f/raw/10c9e17e62dd3f08d3e564cad69324f6f2297380/install-pam_tid-and-pam_reattach.sh)"
