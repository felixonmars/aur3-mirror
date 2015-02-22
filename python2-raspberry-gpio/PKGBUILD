# Maintainer: GRUBERND <grubernd at gmail dot com>
# Contributor: Michael Serpieri <contact at pygoscelis dot org>

pkgname=python2-raspberry-gpio
pkgver=0.5.11
pkgrel=1
pkgdesc="Python2 library for GPIO access on a Raspberry Pi"
arch=('armv6h' 'armv7h')
url="http://sourceforge.net/projects/raspberry-gpio-python/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
replaces=('raspberry-gpio-python')
conflicts=('raspberry-gpio-python')
source=(https://pypi.python.org/packages/source/R/RPi.GPIO/RPi.GPIO-$pkgver.tar.gz)
md5sums=('9dc3dab6ce2b7ccb833a866efb392821')
package() {
	cd $srcdir/RPi.GPIO-$pkgver
	python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
