pkgname=rar2fs
pkgver=1.20.0
_rls="$pkgname-$pkgver"
pkgrel=3
pkgdesc="Fuse file system for reading Rar archives"
arch=(i686 x86_64)
license=(GPL3)
url=https://code.google.com/p/rar2fs/

# The "rar2fs" program loads the "libunrar" library at run time
# using the exact version (5.m.n) installed at build time.
# Also, the "libunrar" source code that "rar2fs" is built with
# should probably be the same version that is installed.
depends=(fuse "libunrar>=1:5.2" "libunrar<1:6")
makedepends=("libunrar>=1:5.2" "libunrar<1:6")

source=(
"$_rls.tar.gz::https://docs.google.com/uc?id=0B-2uEqYiZg3zR1F0b0tmRktiaXc"
)
md5sums=(1cd32b77522eff7fb3db3f7049725a82)

source+=(http://www.rarlab.com/rar/unrarsrc-5.2.2.tar.gz)
md5sums+=(69ef5af8442cbb7dfdebe298bfb9c61a)  # From Arch's "unrar" package

build() {
    cd "$srcdir/$_rls"
    ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
    make
}

package() {
    make -C "$srcdir/$_rls" install DESTDIR="$pkgdir"
}
