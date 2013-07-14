pkgname=rar2fs
pkgver=1.17.2
_rls="$pkgname-$pkgver"
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=(i686 x86_64)
license=(GPL3)
url="https://code.google.com/p/$pkgname"
depends=(fuse "libunrar<1:5")
makedepends=("libunrar<1:5")

source=("https://$pkgname.googlecode.com/files/$_rls.tar.gz")
sha1sums=(b47286dc0f10314dd80e36135aab9b9727a0237b)

source+=(http://www.rarlab.com/rar/unrarsrc-4.2.4.tar.gz)
sha1sums+=(1cc29603fb4e4df16a3aa9bfc7da1afaf0923259)

build() {
    cd "$srcdir/$_rls"
    ./configure --prefix=/usr --with-unrar=../unrar
    make
}

package() {
    make -C "$srcdir/$_rls" install DESTDIR="$pkgdir"
}
