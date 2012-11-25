# Maintainer: Bastien Dejean <baskerville at lavabit.com>

pkgname=xbindkeys-minimal-git
pkgver=20120729
pkgrel=1
pkgdesc='Git version of xbindkeys, without the Tk and Guile dependencies'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/xbindkeys/xbindkeys.html'
license=('GPL')
depends=('libx11')
makedepends=('git')
conflicts=('xbindkeys')
provides=('xbindkeys')

_gitroot='git://git.savannah.nongnu.org/xbindkeys.git'
_gitname='xbindkeys'

build() {
    cd "$srcdir"
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
    else
        git clone $_gitroot $_gitname
    fi

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

    cd "$srcdir/$_gitname-build"
    ./configure --disable-tk --disable-guile --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install
} 
