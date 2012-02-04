# Maintainer: Sam Harada <aur at peasantoid dot org>

pkgname=plisp
pkgver=20100312
pkgrel=1
pkgdesc="Lisp/S-expression parser library"
arch=(i686 x86_64)
url="http://peasantoid.org:1024/plisp"
license=(GPL)
depends=()
makedepends=(mercurial)

build() {
    cd $srcdir
    if test -d plisp; then
        cd plisp
        hg pull || return 1
    else
        hg clone "$url" || return 1
        cd plisp
    fi
    root=$pkgdir ./make install || return 1
}
