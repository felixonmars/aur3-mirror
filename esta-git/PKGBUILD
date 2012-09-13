# Maintainer: Bastien Dejean <baskerville@lavabit.com>

pkgname=esta-git
pkgver=20120913
pkgrel=1
pkgdesc="Dzen2 EWMH status"
arch=('any')
url="https://github.com/baskerville/esta"
license=('BSD')
depends=('libxcb' 'xcb-util-wm' 'lua' 'cairo')
makedepends=('git')
provides=('esta')
conflicts=('esta')
_gitroot='git://github.com/baskerville/esta.git'
_gitname='esta'

build() {
    cd "$srcdir"

    if [[ -d "$_gitname" ]] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi

    cd "$srcdir/$_gitname"
    make
}

package() {
    cd "$srcdir/$_gitname"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
