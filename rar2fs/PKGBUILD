pkgname=rar2fs
pkgver=1.19.8
_rls="$pkgname-$pkgver"
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=(i686 x86_64)
license=(GPL3)
url="https://code.google.com/p/rar2fs/"

# Exactly the same libunrar version 5.m.n is actually needed at run time
depends=(fuse "libunrar>=1:5" "libunrar<1:6")
makedepends=("libunrar>=1:5" "libunrar<1:6")

source=(
"$_rls.tar.gz::https://docs.google.com/uc?id=0B-2uEqYiZg3zYTE5OE1MaWRyX1E"
)
md5sums=(aa2c58a27f9d258c06c5084b042a81b8)

source+=(http://www.rarlab.com/rar/unrarsrc-5.0.14.tar.gz)
md5sums+=(be4261c70a790c61c1747aef59e72db0)  # From Arch's "unrar" package

build() {
    cd "$srcdir/$_rls"
    ./configure --prefix=/usr --with-unrar=../unrar
    make
}

package() {
    make -C "$srcdir/$_rls" install DESTDIR="$pkgdir"
}
