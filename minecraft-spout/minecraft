#!/bin/dash

# fix for users of special IM modules
unset XMODIFIERS GTK_IM_MODULE QT_IM_MODULE

if [ -f ~/.minecraft/bin/minecraft.jar ]; then
	if [ -z "$(unzip -Z1 ~/.minecraft/bin/minecraft.jar|grep spout)" ]; then
		mkdir -p /tmp/minecraft/
		unzip -q ~/.minecraft/bin/minecraft.jar -d /tmp/minecraft/
		unzip -q -o /usr/share/minecraft/spoutcraft.zip -d /tmp/minecraft/
		rm ~/.minecraft/bin/minecraft.jar -f
		cd /tmp/minecraft
		rm /tmp/minecraft/META-INF/ -rf
		zip -9r ~/.minecraft/bin/minecraft.jar *
		cd ~; rm -rf /tmp/minecraft
	fi
fi

LD_LIBRARY_PATH="/opt/java/jre/lib/i386/:/opt/java/jre/lib/amd64/" exec java -Xmx1024M -Xms512M -cp /usr/share/minecraft/minecraft.jar net.minecraft.LauncherFrame $@
