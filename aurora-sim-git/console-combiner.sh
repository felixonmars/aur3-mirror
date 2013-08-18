#!/bin/sh
cd /srv/aurora-sim
exec mono --debug ConsoleCombiner.exe $@
