# Maintainer: Manuel Fill <ap0calypse@agitatio.org>
pkgname=secc-git
pkgver=20130802
pkgrel=1
pkgdesc="sec - the free and simple encrypted chat (client)"
arch=('any')
url="http://github.com/ap0calypse/secc"
license=('GPL')
depends=('perl-curses-ui' 'perl-crypt-cbc')
makedepends=('git')
provides=('secc')

_gitroot="https://github.com/ap0calypse/secc.git"
_gitname="secc"

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
    install -D -m755 secc "${pkgdir}/usr/local/bin/secc"
} 
