_proj=pyarrfs
pkgname="$_proj"
_commit=30dcc9d
pkgver="0.7.2+g$_commit"
_acc=plajjan
pkgrel=1
pkgdesc="File system that represents Rar files as directories"
arch=(any)
license=(MIT)
url="http://labs.spritelink.net/$_proj"
depends=(python2 python-fuse python2-rarfile)
makedepends=(python2 python-fuse python2-rarfile)

source=("https://github.com/$_acc/$_proj/tarball/$_commit")
md5sums=(b3d59cb11efcff81be4582ab9187064f)

package() {
    cd "$srcdir/$_acc-$_proj-$_commit"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
