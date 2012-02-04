# Maintainer: Kostas Michalopoulos <badsectoracula@gmail.com>
pkgname=ol-git
pkgver=20110131
pkgrel=1
pkgdesc="Console based outliner / hierarchical text editor"
arch=('i686' 'x86_64')
url='https://github.com/badsector/ol'
license=('ZLIB')
makedepends=('git' 'fpc' 'make')
#install=${pkgname}.install

_gitroot="git://github.com/badsector/ol.git"
_gitname="master"

build() {
    msg "Connecting to git server..."

    if [ -d ${_gitname} ] ; then
        cd ${_gitname}
        git pull origin master
        msg "The local files are updated."
    else
        cd ${srcdir}
        git clone ${_gitroot}
    fi

    msg "Git checkout done (or server timed out)"
    msg "Starting make..."

    cd ${srcdir}/ol
    make PREFIX="${pkgdir}/usr" PKGNAME=${pkgname}
}

package() {
    cd ${srcdir}/ol
    make PREFIX="${pkgdir}/usr" PKGNAME=${pkgname} install
}

