# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=python-lice
_pkgname=lice
pkgver=0.4
pkgrel=1
pkgdesc="Generates license files. No more hunting down licenses from other projects."
arch=(any)
url="https://github.com/jcarbaugh/lice"
license=('BSD')
depends=('python')
conflicts=('python2-lice')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/l/lice/lice-${pkgver}.tar.gz")
md5sums=('5c9194c486c090ca197a38d701a4d775')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # a patch was sent upstream about the issue fixed below, using a sed
  # substitution for now
  sed -i 's/template.decode("UTF-8")/template/' lice/core.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
