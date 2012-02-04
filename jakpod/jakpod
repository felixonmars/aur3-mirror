#!/bin/bash
set -e

mkdir -p ~/.jakpod

cd ~/.jakpod

[ -f jakpod.properties ] || cp /opt/jakpod/jakpod.properties .
[ -f iPod.properties ] || cp /opt/jakpod/iPod.properties .

java -Xmx512M -cp . -jar /opt/jakpod/jakpod.jar
