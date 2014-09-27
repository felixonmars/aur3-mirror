pkgbase=python-tkintertable
pkgname=python2-tkintertable
pkgver=1.1.2
pkgrel=1
pkgdesc="Interactive spreadsheet-style tables for Python's \"tkinter\" module"
arch=(any)
url="https://code.google.com/p/tkintertable/"
license=(GPL)
makedepends=("python2>=2.5")
depends=("${makedepends[@]}" python2-pmw tk)
optdepends=(python2-{matplotlib,numpy})
provides=(python-tkintertable)
source=(
    "https://tkintertable.googlecode.com/files/tkintertable-$pkgver.tar.gz"
)
sha1sums=(8604ac22dbcb940d692944e36dcdb7f94a9046b8)

build() {
  cd "$srcdir/tkintertable-$pkgver"
  python2 setup.py build
}

package() {
    cd "$srcdir/tkintertable-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
