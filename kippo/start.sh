#!/bin/sh

echo "Starting kippo in background..."
su -s /bin/sh -c "twistd -y kippo.tac -l log/kippo.log --pidfile kippo.pid" kippo
