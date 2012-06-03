pkgname=python2-misspellings
_pkgname=misspellings
pkgver=1.4
pkgrel=1
pkgdesc="This is a Python library and tool to check for misspelled words in source code."
arch=('any')
url="https://github.com/lyda/misspell-check"
license=('GPL3')
depends=('python2')
conflicts=('python-misspellings')
source=("https://github.com/downloads/lyda/misspell-check/misspellings-$pkgver.tar.gz")
md5sums=('970b287bed4f18d78778f15d32002f10')
sha256sums=('a9c8da74bad719398e1a51f7a9cc81cfe631472744de27706bada2d062432f54')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
