# Maintainer: Ben Croston <ben@croston.org>
# Contributor: kreativmonkey <kreativmonkey@calyrium.org>
pkgname=python2-rpi.gpio
pkgver=0.5.9
pkgrel=2
pkgdesc="Python library for GPIO access on a Raspberry Pi"
arch=(armv6l armv6h)
url="http://sourceforge.net/projects/raspberry-gpio-python/"
license=('MIT')
groups=
provides=
depends=('python2')
makedepends=('python2-distribute')
conflicts=('raspberry-gpio-python')
replaces=('raspberry-gpio-python')
backup=('etc/foo/foo.conf')
source=('http://pypi.python.org/packages/source/R/RPi.GPIO/RPi.GPIO-'$pkgver'.tar.gz')
md5sums=('54ea6ef33502d43e3a89713593315e5a')

build() {
	cd $srcdir/RPi.GPIO-$pkgver
}
package() {
  	cd $srcdir/RPi.GPIO-$pkgver
  	python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
