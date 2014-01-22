# Maintainer: Michael Serpieri contact at pygoscelis dot org
# Contributor: Tomas Sironi  <sironitomas at gmail.com>

pkgname=raspberry-gpio-python
pkgver=0.5.4
pkgrel=1
pkgdesc="Python library for GPIO access on a Raspberry Pi"
arch=('any')
url="http://code.google.com/p/raspberry-gpio-python/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python2-raspberry-gpio')
source=(http://pypi.python.org/packages/source/R/RPi.GPIO/RPi.GPIO-$pkgver.tar.gz)
md5sums=('add6554ed8331d515fccb5e052c7d1ff')
build() {
	cd $srcdir/RPi.GPIO-$pkgver
	python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
