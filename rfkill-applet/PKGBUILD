# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=rfkill-applet
pkgver=0.2
pkgrel=1
pkgdesc="Applet showing actual state of RFKill (enabled or disabled radio)"
arch=('any')
license=('GPL')
url="http://aur.archlinux.org/packages.php?ID=29688"
depends=('gtk2-perl')
source=('rfkill-applet.pl' 'rfkill-applet.desktop')
md5sums=('bc2bd4c63c6ff58acbad2ecbf32a6f68'
         'ff521aa4db9853d695c36a5337a0c250')

build() {
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/etc/xdg/autostart

	cp -f ${srcdir}/rfkill-applet.pl ${pkgdir}/usr/bin/
	cp -f ${srcdir}/rfkill-applet.desktop ${pkgdir}/etc/xdg/autostart/

	chmod -R 755 ${pkgdir}/
}
