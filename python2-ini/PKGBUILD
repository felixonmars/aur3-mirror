# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=python2-ini
pkgver=0.1
pkgrel=1
pkgdesc="Simple json/pickle like ini-file parsing."
arch=(any)
url="http://pypi.python.org/pypi/INI/0.1"
license=('MIT')
depends=('python2')
options=('!libtool')
source=(http://pypi.python.org/packages/source/I/INI/INI-$pkgver.tar.gz)
md5sums=('9969fa50b77e02c6d48edc7ed6a52e2f')

build() {
  cd "$srcdir/INI-$pkgver"

  export PYTHON="/usr/bin/python2"

  python2 setup.py build
}

package() {
  cd "$srcdir/INI-$pkgver"

  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build 
}
