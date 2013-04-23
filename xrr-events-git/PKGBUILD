# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>

_pkgname=xrr-events
pkgname=$_pkgname-git
pkgdesc="XRandR event notification daemon"
pkgver=0.8.1
pkgrel=1
arch=(i686 x86_64)
url=https://github.com/sagara-/xrr-events
license=(GPL2)
depends=(libxrandr)
makedepends=(git)
source=("git://github.com/sagara-/xrr-events.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    cat xrr-events.cpp | sed -n 's/#define *VERSION *\"\([0-9.]\+\)\"/\1/p'
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 xrr-events "$pkgdir/usr/bin/xrr-events"
    install -Dm644 xrr-events.1 "$pkgdir/usr/share/man/man1/xrr-events.1"
    gzip -9 "$pkgdir/usr/share/man/man1/xrr-events.1"
}
