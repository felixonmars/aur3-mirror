# Maintainer: Sam Harada <aur at peasantoid dot org>

pkgname=pynesweeper
pkgver=20100625
pkgrel=1
pkgdesc="ncurses Minesweeper implementation in Python"
arch=(i686 x86_64)
url="http://peasantoid.org:1024/pynesweeper"
license=(GPL)
depends=(python ncurses)
makedepends=(mercurial)

build() {
    cd "$srcdir"
    if test -d "$pkgname"; then
        cd "$pkgname"
        hg pull || return 1
        hg update || return 1
    else
        hg clone "$url" || return 1
        cd "$pkgname"
    fi

    install -Dm0755 pynesweeper "$pkgdir/usr/bin/pynesweeper"
    install -Dm0644 config.py "$pkgdir/usr/share/pynesweeper/config.py"
}
