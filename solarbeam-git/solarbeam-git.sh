#!/bin/bash

cd /opt/solarbeam
mono solarbeam.exe "$@"
exit $?
