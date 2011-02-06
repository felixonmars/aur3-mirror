# Maintainer: Magnus Therning <magnus@therning.org>

pkgname=vng-git
pkgver=20100908
pkgrel=1
pkgdesc='Darcs-like front-end for git'
arch=('i686' 'x86_64')
url='http://gitorious.org/vng'
license=('GPL3')
depends=('qt>=4.4')
makedepends=('git')
provides=('vng')
conflicts=('vng')
changelog=$pkgname.changelog

_gitroot='git://gitorious.org/vng/vng.git'
_gitname='vng'

build() {
    cd "$srcdir"

    if [ -d $_gitname ]; then
        msg "Updating local files"
        (cd $_gitname; git pull origin)
    else
        msg "Cloning upstream"
        git clone $_gitroot
    fi

    msg "GIT checkout done, or server timeout..."

    rm -rf ${_gitname}_build
    mkdir ${_gitname}_build
    cd ${_gitname}_build
    qmake ../${_gitname}/vng.pro
    make
}

package() {
    cd "$srcdir/${_gitname}_build"

    install -Ds vng "$pkgdir/usr/bin/vng"
}
