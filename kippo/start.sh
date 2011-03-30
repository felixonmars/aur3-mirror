#!/bin/sh

echo "Starting kippo in background..."
sudo -u kippo twistd -y kippo.tac -l log/kippo.log --pidfile kippo.pid
