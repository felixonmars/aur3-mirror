#!/bin/bash
cd /usr/share/starfarer

exec java -Djava.library.path=./native/linux -Xms256m -Xmx256m -classpath janino.jar:commons-compiler.jar:commons-compiler-jdk.jar:starfarer.api.jar:starfarer_obf.jar:jogg-0.0.7.jar:jorbis-0.0.15.jar:json.jar:lwjgl.jar:jinput.jar:log4j-1.2.9.jar:lwjgl_util.jar:fs.sound_obf.jar:fs.common_obf.jar -Dcom.fs.starfarer.settings.paths.saves=./saves -Dcom.fs.starfarer.settings.paths.screenshots=./screenshots -Dcom.fs.starfarer.settings.paths.mods=./mods com.fs.starfarer.StarfarerLauncher
