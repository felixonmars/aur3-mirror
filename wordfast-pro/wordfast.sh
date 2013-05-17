#!/bin/bash

if [[ $(uname -m) == 'x86_64' ]]
then
  export JAVA_HOME=/usr/lib/jvm/bin32-java-7-openjdk/jre
  export PATH=/usr/lib/jvm/bin32-java-7-openjdk/jre/bin:$PATH
fi

/opt/wordfast-pro/Wordfast

