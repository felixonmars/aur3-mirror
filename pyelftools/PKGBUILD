pkgname=pyelftools
pkgver=0.20
pkgrel=2
pkgdesc="A pure-Python library for parsing and analyzing ELF files and DWARF debugging information."
arch=('any')
url="http://pypi.python.org/pypi/pyelftools/"
license=('custom')
depends=('python')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d02e40a841a8cc38d78cdea8e497f601969e7270ebe00c7e671a3ce73f1cdf45')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root "$pkgdir" --optimize=1
  install -Dm0444 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
