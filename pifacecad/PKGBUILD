# $Id$
# Maintainer: Eelco Cramer <eelco@servicelab.org>

pkgname=pifacecad
pkgver=2.0.3
pkgrel=1
pkgdesc="PiFace Control and Display Python module"
arch=('any')
url="https://github.com/piface/pifacecad"
license=('GPL3')
depends=('python'
         'pifacecommon'
         'python-lirc')
makedepends=('python-distribute')
source=(https://github.com/piface/pifacecad/archive/v${pkgver}.tar.gz)
md5sums=('78564ab4eadf05603c1069c235ba0ebd')

build() {
  cd $srcdir/$pkgname-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir install
}

