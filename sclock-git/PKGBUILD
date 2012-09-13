# Maintainer: Bastien Dejean <baskerville@lavabit.com>

pkgname=sclock-git
pkgver=20120913
pkgrel=1
pkgdesc="Status aimed time output"
arch=('any')
url="https://github.com/baskerville/sclock"
license=('BSD')
makedepends=('git')
provides=('sclock')
conflicts=('sclock')
_gitroot='git://github.com/baskerville/sclock.git'
_gitname='sclock'

build() {
    cd "$srcdir"

    if [[ -d "$_gitname" ]] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi

    cd "$srcdir/$_gitname"
    make sclock
}

package() {
    cd "$srcdir/$_gitname"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 sclock "$pkgdir/usr/bin/sclock"
}
