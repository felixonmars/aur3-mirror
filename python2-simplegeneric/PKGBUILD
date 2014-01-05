# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python2-simplegeneric
pkgver=0.8.1
pkgrel=1
pkgdesc="Simple generic functions"
arch=('any')
url="http://pypi.python.org/pypi/simplegeneric"
license=('PSF' 'ZPL')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/s/simplegeneric/simplegeneric-$pkgver.zip")
md5sums=('f9c1fab00fd981be588fc32759f474e3')

build() {
  cd simplegeneric-$pkgver
  python2 setup.py build
}

package() {
  cd simplegeneric-$pkgver
  python2 setup.py install --root="$pkgdir/"
}
