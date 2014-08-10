#!/bin/sh

echo "Starting kippo in background..."
su -c "twistd -y kippo.tac -l log/kippo.log --pidfile kippo.pid" kippo

