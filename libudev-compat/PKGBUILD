# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libudev-compat
pkgver=0.1
pkgrel=1
pkgdesc="Dirty hack to make libudev.so.0 available"
arch=('any')
url="http://www.eworm.de/"
license=('GPL')
depends=('systemd')

package() {
	install -d ${pkgdir}/usr/lib/
	ln -s libudev.so.1 ${pkgdir}/usr/lib/libudev.so.0
}

