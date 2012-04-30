pkgname=rar2fs
pkgver=1.15.0
_rls="$pkgname-$pkgver"
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=(i686 x86_64)
license=(GPL3)
url="https://code.google.com/p/$pkgname/"
depends=(fuse libunrar)
makedepends=(libunrar)

source=("https://$pkgname.googlecode.com/files/$_rls.tar.gz")
sha1sums=(28b9a9737a5f9d53c4495cb5b4892d487bceb12f)

source+=(http://www.rarlab.com/rar/unrarsrc-4.1.4.tar.gz)
sha1sums+=(ae4b1e2c99e96527c4a97f980daa547499f42a0f)

build() {
    cd "$srcdir/$_rls"
    ./configure --prefix=/usr --with-unrar=../unrar
    make
}

package() {
    make -C "$srcdir/$_rls" install DESTDIR="$pkgdir"
}
