# Maintainer: Manuel Fill <ap0calypse@agitatio.org>
pkgname=secd-git
pkgver=20130802
pkgrel=1
pkgdesc="sec - the free and simple encrypted chat (daemon)"
arch=('any')
url="http://github.com/ap0calypse/secd"
license=('GPL')
depends=()
makedepends=('git')
provides=('secd')

_gitroot="https://github.com/ap0calypse/secd.git"
_gitname="secd"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
    cd "$srcdir/$_gitname-build"
    install -D -m755 secd "${pkgdir}/usr/local/bin/secd"
} 
