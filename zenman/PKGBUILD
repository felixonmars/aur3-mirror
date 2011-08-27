# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=zenman
pkgver=1.8
pkgrel=2
pkgdesc="PacMan frontend (tray update notifier) for GTK/GNOME/zenity/libnotify. Simplier, more straightforward and less annoying Alunn alternative. zenman --help for more..."
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=25948"
depends=('pacman' 'gksu' 'xterm' 'zenity' 'libnotify' 'bash')
optdepends=('espeak: Text-to-Speech update notification')
source=('zenman.bash')
md5sums=('7e56bc7df2a053faf37945b8dbe851df')

build() {
	mkdir -p ${pkgdir}/usr/bin
	#cp -f ${startdir}/zenman.bash ${pkgdir}/usr/bin/zenman
	cp -f ${srcdir}/zenman.bash ${pkgdir}/usr/bin/zenman

mkdir -p ${pkgdir}/usr/share/applications

	echo '[Desktop Entry]
Encoding=UTF-8
Name=ZenMan
Comment=Pacman frontend using zenity
Comment[cs]=Grafické rozhraní pro pacman založené na zenity
GenericName=Pacman Update Notifier
Type=Application
TryExec=/usr/bin/zenman
Exec=zenman
Icon=face-cool
Terminal=false
Categories=Application;System;
' > ${pkgdir}/usr/share/applications/zenman.desktop

	echo '[Desktop Entry]
Encoding=UTF-8
Name=ZenMan (stop)
Comment=STOP ZenMan
GenericName=Stop Pacman Update Notifier
Type=Application
TryExec=/usr/bin/zenman 
Exec=zenman --stop
Icon=face-tired
Terminal=false
Categories=Application;System;
' > ${pkgdir}/usr/share/applications/zenman-stop.desktop

	chmod -R 755 ${pkgdir}/
}
