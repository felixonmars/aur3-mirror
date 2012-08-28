# Maintainer: osily <ly50247 at gmail dot com>

pkgname=shadaradio-git
pkgver=20120828
pkgrel=1
pkgdesc='A simple radio.'
arch=('i686' 'x86_64')
url='https://code.google.com/p/shadaradio'
license=('GPL3')
depends=('qt' 'mplayer')
makedepends=('git')

_gitroot="https://ly50247@code.google.com/p/shadaradio/"
_gitname="shadaradio"

build() {
    cd $srcdir
    msg "Connection to GIT server ..."
    if [ -d $_gitname ]; then
        cd $_gitname
        git pull
    else
        git clone $_gitroot
        cd $_gitname
    fi
    msg "Git checkout done."
    qmake && make || return 1
    mkdir -p "$pkgdir/usr/bin/" || return 1
    install -D -m755 shadaradio $pkgdir/usr/bin || return 1
}
