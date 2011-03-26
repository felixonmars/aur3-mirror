#!/bin/sh
CP='cp -v'
pfx=${PREFIX:-/usr/local}
scons
$CP ./orthos $pfx/bin/orthos
$CP ./skins/libdefault.so $pfx/lib/orthos-default.so
echo > /etc/orthos.conf
echo -e "sessions\tfailsafe:/usr/bin/xterm:clock:/usr/bin/xclock" >>/etc/orthos.conf
echo -e "Xserver\t/usr/bin/Xorg" >>/etc/orthos.conf
echo -e "skin\t$pfx/lib/orthos-default.so" >>/etc/orthos.conf

