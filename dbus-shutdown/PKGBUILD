# Maintainer: RétroX <classixretrox@gmail.com>

pkgname=dbus-shutdown
pkgver=1.1
pkgrel=1
pkgdesc="A collection of scripts to halt, reboot, suspend, and hibernate with dbus."
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=127962"
license=('GPL')
depends=('dbus' 'consolekit' 'upower')
source=('dbus-halt'
        'dbus-reboot'
        'dbus-suspend'
        'dbus-hibernate')
md5sums=('7f2df025fb19102819c0a9c0964c23be'
         'bac1836bb3cd0631c1992b66c64725af'
         '30c5651e20a0e284d05147b30b20ec1f'
         '7e4f8d5bbad3cbc4a1067d8f83e897a1')

package()
{
	mkdir -p ${pkgdir}/usr/bin
	install -m755 ${srcdir}/dbus-halt      -D ${pkgdir}/usr/bin
	install -m755 ${srcdir}/dbus-reboot    -D ${pkgdir}/usr/bin
	install -m755 ${srcdir}/dbus-suspend   -D ${pkgdir}/usr/bin
	install -m755 ${srcdir}/dbus-hibernate -D ${pkgdir}/usr/bin
}
