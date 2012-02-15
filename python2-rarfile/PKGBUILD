_proj=rarfile
pkgname="python2-$_proj"
pkgver=2.5
pkgrel=1
pkgdesc="Rar archive reader for Python"
arch=(any)
url="https://pypi.python.org/pypi/$_proj"
license=(custom:ISC)
depends=()
optdepends=("unrar: For decompression")
provides=("python-$_proj")
source=(
  "https://pypi.python.org/packages/source/r/$_proj/$_proj-$pkgver.tar.gz"
)
md5sums=(da87eb870c9e504394b91c9618ff74c6)

package() {
  cd "$srcdir/$_proj-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
