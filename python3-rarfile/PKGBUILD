_proj=rarfile
pkgname="python3-$_proj"
pkgver=2.2
_ver="$_proj-$pkgver"
pkgrel=1
pkgdesc="Rar archive reader for Python"
arch=(any)
url="http://$_proj.berlios.de/"
license=(custom:ISC)
depends=() #(python3)
optdepends=("unrar: For decompression")
provides=(python-rarfile)
source=(http://download.berlios.de/$_proj/$_ver.tar.gz)
md5sums=(d61e4d885a564048e41c67e650cfe6fa)

package() {
  cd "$srcdir/$_ver"
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
