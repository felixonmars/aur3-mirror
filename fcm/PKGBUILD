# Maintainer: Sam Harada <aur at peasantoid dot org>

pkgname=fcm
pkgver=20100323
pkgrel=1
pkgdesc="File Change Monitor"
arch=(i686 x86_64)
url="http://peasantoid.org:1024/fcm"
license=(GPL)
depends=()
makedepends=(mercurial)

build() {
    cd "$srcdir"
    if test -d fcm; then
        cd fcm
        hg pull || return 1
        hg update || return 1
    else
        hg clone "$url" || return 1
        cd fcm
    fi
    make DESTDIR="$pkgdir" install || return 1
}
