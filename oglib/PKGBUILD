# Maintainer: Oliver Sherouse <oliver sherouse at gmail com>
pkgname=oglib
pkgver=0.1.0
pkgrel=2
pkgdesc="Common classes and functions for Ogden"
arch=('any')
url="http://code.google.com/p/ogden/"
license=('GPL')
depends=('pygtk' 'python-decorator' 'pyxdg')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/o/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=("a10ff3c24cc46b9cffa48f47cc0d2bf7")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
