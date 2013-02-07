# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=lib32-libudev-compat
pkgver=0.1
pkgrel=1
pkgdesc="Dirty hack to make libudev.so.0 available"
arch=('x86_64')
url="http://www.eworm.de/"
license=('GPL')
depends=('lib32-systemd')

package() {
	install -d ${pkgdir}/usr/lib32/
	ln -s libudev.so.1 ${pkgdir}/usr/lib32/libudev.so.0
}

