#!/bin/sh

cd '/etc/cloudprint-server/connectors/'
python2 '/usr/lib/cloudprint-server/generate_cloudprint_config.py'

newf="$(ls -1t | head -1)"
cp -v "$newf" '/etc/cloudprint-server/Service State'
