# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=keylog
pkgver=0.6
pkgrel=2
pkgdesc="Simple keyloger using /dev/input."
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=26497"
depends=('glibc')
source=('klog.c')
md5sums=('a6ba53cdd6df91203e5a15ba7098b0c8')

build() {
	mkdir -p ${pkgdir}/usr/bin
	gcc ${startdir}/klog.c -o ${pkgdir}/usr/bin/keylog

mkdir -p ${pkgdir}/usr/share/applications

	echo '[Desktop Entry]
Encoding=UTF-8
Name=KeyLog
Comment=Reads keystrokes from /dev/input events
Comment[cs]=Zobrazuje stisky kláves zjištěné z událostí v /dev/input
GenericName=Key Loger
Type=Application
TryExec=/usr/bin/xterm
Exec=xterm -e "sudo /usr/bin/keylog /dev/input/event1; sleep 5;"
Icon=preferences-desktop-keyboard
Terminal=false
Categories=Application;System;
' > ${pkgdir}/usr/share/applications/key-loger.desktop

	chmod -R 755 ${pkgdir}/
}
