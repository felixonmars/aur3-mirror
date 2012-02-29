#!/bin/bash -e

cd "/opt/lcdgen/" >/dev/null

java -jar lcdgen.jar

cd - >/dev/null
