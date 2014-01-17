# Maintainer: Ivo Nunes <ivoavnunes at gmail dot com>

_pkgname="musicboxpt-linux"
pkgname="${_pkgname}-git"
pkgver=1+g4a3369b
pkgrel=1
pkgdesc="Wine wrapper around Music Box for Linux."
arch=('i686' 'x86_64')
url="https://github.com/ivonunes/musicboxpt-linux"
license=('GPL3')
depends=('zenity' 'wine' )
makedepends=()
provides=('musicboxpt-linux')
source=("${_pkgname}::git+https://github.com/ivonunes/musicboxpt-linux.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

build() {
    cd "${_pkgname}"
}

package() {
    cd "${_pkgname}"
    mkdir -p ${pkgdir}/usr/bin
    cp musicbox ${pkgdir}/usr/bin/musicbox
}
