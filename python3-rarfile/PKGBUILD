_proj=rarfile
pkgname="python3-$_proj"
pkgver=2.4
_tag="${_proj}_${pkgver/./_}"
_acc=markokr
_rev=201b9fe
pkgrel=1
pkgdesc="Rar archive reader for Python"
arch=(any)
url="https://github.com/$_acc/$_proj"
license=(custom:ISC)
depends=()
optdepends=("unrar: For decompression")
provides=("python-$_proj")
source=("https://github.com/$_acc/$_proj/tarball/$_tag")
md5sums=(d19464737339a24726038d1d6839773d)

package() {
  cd "$srcdir/$_acc-$_proj-$_rev"
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
