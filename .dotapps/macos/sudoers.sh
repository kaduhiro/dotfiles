#!/bin/sh
[ "$OSNAME" = 'macos' ]

# Enable sudo by Touch ID
sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
