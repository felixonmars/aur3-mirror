# Maintainer: Alexey Michurin <a.michurin@gmail.com>

pkgname=python2-pyrad
pkgver=2.0
pkgrel=0
pkgdesc='Pure Python implementation of a RADIUS client as described in RFC2865'
arch=('any')
license=('BSD')
url='https://github.com/wichert/pyrad'
makedepends=('python2')
source=('https://pypi.python.org/packages/source/p/pyrad/pyrad-2.0.tar.gz')
md5sums=('e95f2cef1a191c1c891779dff8fb0255')

build() {
  cd "$srcdir/pyrad-$pkgver"
  python2 setup.py build
}

package_python2-pyrad() {
  depends=('python2')
  cd "$srcdir/pyrad-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
