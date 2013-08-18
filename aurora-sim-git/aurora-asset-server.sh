#!/bin/sh
cd /srv/aurora-sim
exec mono --debug Aurora.AssetServer.exe $@
