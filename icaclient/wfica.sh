#!/bin/sh
ICAROOT=/opt/Citrix/ICAClient
export ICAROOT
/opt/Citrix/ICAClient/wfica -file "$1"
