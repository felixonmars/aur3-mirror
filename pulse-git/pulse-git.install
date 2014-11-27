#!/bin/bash

post_install() {
	systemctl daemon-reload

cat << EOF
  WebGUI can be accessed at http://localhost:8080

  To start Pulse, execute:

    systemctl start pulse@user

  where 'user' is your username.

  To autostart pulse on system start, execute

    systemctl enable pulse@user

  where 'user' is your username.

EOF
}

post_upgrade() {
	systemctl daemon-reload
}

post_remove() {
	systemctl daemon-reload
}
