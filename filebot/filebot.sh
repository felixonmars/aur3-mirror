#!/bin/bash
java -Dapplication.deployment=aur -Djna.library.path=/usr/share/java/filebot -Xmx256m -jar /usr/share/java/filebot/filebot.jar "$@"
