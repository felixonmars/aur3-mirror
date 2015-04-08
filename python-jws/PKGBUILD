# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>
# Submitter: Zoran Zeric <zz@zoranzaric.de>

pkgname=python-jws
pkgver=0.1.3
pkgrel=1
pkgdesc="JSON Web Signatures implementation in Python"
arch=('any')
url="https://pypi.python.org/pypi/jws/0.1.3"
license=('MIT')
depends=()
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/j/jws/jws-$pkgver.tar.gz")
md5sums=('2d1dbd8dde4d2965b425add86963fa6e')

build() {

  cd $srcdir/jws-$pkgver
  python setup.py build
}

package() {

  cd $srcdir/jws-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
