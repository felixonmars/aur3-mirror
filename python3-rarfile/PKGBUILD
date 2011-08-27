_proj=rarfile
pkgname="python3-$_proj"
pkgver=2.3
_rls="$_proj-$pkgver"
pkgrel=1
pkgdesc="Rar archive reader for Python"
arch=(any)
url="http://$_proj.berlios.de/"
license=(custom:ISC)
depends=()
optdepends=("unrar: For decompression")
provides=("python-$_proj")
source=(http://download.berlios.de/$_proj/$_rls.tar.gz)
md5sums=(523282dd5c9453814ca5988d0ede5336)

package() {
  cd "$srcdir/$_rls"
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
