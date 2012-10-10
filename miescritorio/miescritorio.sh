#!/bin/bash

/usr/share/miescritorio/aplicacion/miescritorio.sh && kill -9 $(ps ax | grep jetty-starter/educar-desktop-web.war | grep -v grep | awk '{ print $1 }')

