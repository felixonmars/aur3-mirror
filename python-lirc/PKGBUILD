# $Id$
# Maintainer: Eelco Cramer <eelco@servicelab.org>

pkgname=python-lirc
pkgver=1.2.1
pkgrel=1
pkgdesc="LIRC extension written in Cython for Python 3"
arch=('any')
url="https://github.com/piface/pifacecad"
license=('GPL3')
depends=('python'
         'lirc'
         'cython')
makedepends=('python-distribute')
source=(https://github.com/tompreston/python-lirc/archive/v${pkgver}.tar.gz)
md5sums=('9142810618c9f3bcb5bbf519941a64af')

build() {
  cd $srcdir/$pkgname-${pkgver}
  make py3
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir install
}

