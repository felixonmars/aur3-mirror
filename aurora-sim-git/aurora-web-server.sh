#!/bin/sh
cd /srv/aurora-sim
exec mono --debug Aurora.WebServer.exe $@
