# Maintainer: Teo Mrnjavac <teo@kde.org>

pkgname='icemon-git'
_gitname='icemon'
pkgver=r408.20ab8ff
pkgrel=1
pkgdesc='Icecream GUI monitor.'
url='https://github.com/icecc/icemon'
license=('GPL')
depends=('gcc-libs' 'bash' 'icecc' 'qt4')
provides=('icemon')
arch=('i686' 'x86_64')

source=('git://github.com/icecc/icemon.git')

md5sums=('SKIP')

pkgver() {
    cd ${_gitname}

    # Use the tag of the last commit
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_gitname}

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${_gitname}/build"

    make DESTDIR="${pkgdir}" install
}
