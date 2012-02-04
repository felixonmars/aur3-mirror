# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer:		Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=dream-strobe
pkgver=3
pkgrel=1
pkgdesc="Stroboscope implementation for GNU/Linux console. Also called 'Dream Machine' or 'Strobe'. Can be used to alternate state of consciousness by affecting brainwave frequencies. Use only at your own risk!"
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=27012"
depends=()
source=('strobe.c')
md5sums=('8df74539c4f79aaf54a8a6d4423e3b4a')

build() {
	mkdir -p ${pkgdir}/usr/bin
	gcc -O3 ${startdir}/strobe.c -o ${pkgdir}/usr/bin/dream-strobe || return 1

mkdir -p ${pkgdir}/usr/share/applications

	echo '[Desktop Entry]
Encoding=UTF-8
Name=Dream Strobe (10 Hz)
Comment=Strobe (Dream Machine)
Comment[cs]=Stroboskop (Stroj na sny)
GenericName=10 Hz Stroboscope
Type=Application
TryExec=/usr/bin/xterm
Exec=xterm -e '/usr/bin/dream-strobe 10'
Icon=weather-storm
Terminal=false
Categories=Application;Utility;
' > ${pkgdir}/usr/share/applications/dream-strobe.desktop

	chmod -R 755 ${pkgdir}/
}
