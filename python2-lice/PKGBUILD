# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=python2-lice
_pkgname=lice
pkgver=0.4
pkgrel=1
pkgdesc="Generates license files. No more hunting down licenses from other projects."
arch=(any)
url="https://github.com/jcarbaugh/lice"
license=('BSD')
depends=('python2')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/l/lice/lice-${pkgver}.tar.gz")
md5sums=('5c9194c486c090ca197a38d701a4d775')

buid() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
