#!/bin/sh

goinstall $* &&
find /opt/go -user `whoami` -print0 | xargs -0 chmod g+w
