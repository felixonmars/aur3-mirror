# Maintainer: Hilton Medeiros <medeiros.hilton at gmail dot com>

pkgname=python-pygtkhelpers
_pkgname=pygtkhelpers
pkgver=0.4.2
pkgrel=2
pkgdesc="A library to assist the building of PyGTK applications"
arch=('any')
url="http://packages.python.org/pygtkhelpers"
license=('LGPL3')
depends=('pygtk')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('f6d7cbc2aefb570633dc6f702e2e724f')

build() {
  /bin/true
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
