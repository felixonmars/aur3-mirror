pkgname=rar2fs
pkgver=1.18.0
_rls="$pkgname-$pkgver"
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=(i686 x86_64)
license=(GPL3)
url="https://code.google.com/p/$pkgname"
depends=(fuse "libunrar<1:6")
makedepends=("libunrar<1:6")

source=("https://$pkgname.googlecode.com/files/$_rls.tar.gz")
sha1sums=(43585590a73d5f8fb59605c43e172e5e73d12c8f)

source+=(http://www.rarlab.com/rar/unrarsrc-5.0.12.tar.gz)
sha1sums+=(03d61213ff810650fc06113ffe153712176af4dd)

build() {
    cd "$srcdir/$_rls"
    ./configure --prefix=/usr --with-unrar=../unrar
    make
}

package() {
    make -C "$srcdir/$_rls" install DESTDIR="$pkgdir"
}
