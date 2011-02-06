# Maintainer: Sam Harada <aur at peasantoid dot org>

pkgname=shman
pkgver=20100326
pkgrel=2
pkgdesc="bash implementation of man"
arch=(any)
url="http://peasantoid.org:1024/shman"
license=(GPL)
depends=(bash groff grep)
makedepends=(mercurial)
source=('shman.cron.daily')
md5sums=('1e97e556071e79f6d5cba6160d1c295b')
install="$pkgname.install"

build() {
    cd "$srcdir"
    if test -d shman; then
        cd shman
        hg pull || return 1
        hg update || return 1
    else
        hg clone "$url" || return 1
        cd shman
    fi
    make DESTDIR="$pkgdir" install || return 1

    cd "$srcdir/.."
    rm "$pkgdir/usr/bin/man" # do not conflict with f.e. man-db
    install -Dm755 shman.cron.daily "$pkgdir/etc/cron.daily/shman"
    touch "$pkgdir/etc/shmantab" # to put it under pacman control
}
