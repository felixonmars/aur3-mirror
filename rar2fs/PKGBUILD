pkgname=rar2fs
pkgver=1.19.5
_rls="$pkgname-$pkgver"
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=(i686 x86_64)
license=(GPL3)
url="https://code.google.com/p/$pkgname"

# Exactly the same libunrar version 5.m.n is actually needed at run time
depends=(fuse "libunrar>=1:5" "libunrar<1:6")
makedepends=("libunrar>=1:5" "libunrar<1:6")

source=(
"$_rls.tar.gz::https://docs.google.com/uc?id=0B-2uEqYiZg3zd2k4Q3duUUUtczA"
)
md5sums=(78d9d777abd254825f662f8bf115e695)

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
