# $Id$
# Maintainer: Eelco Cramer <eelco@servicelab.org>

pkgname=pifacecommon
pkgver=4.0.0
pkgrel=1
pkgdesc="Common functions for interacting with PiFace products."
arch=('any')
url="https://github.com/piface/pifacecad"
license=('GPL3')
depends=('python')
makedepends=('python-distribute')
source=(https://github.com/piface/pifacecommon/archive/v${pkgver}.tar.gz)
md5sums=('0943e8c3a4b50e081fa9558470e02aee')

build() {
  cd $srcdir/$pkgname-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir install
}

