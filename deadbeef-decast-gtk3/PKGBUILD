# Maintainer: Viktor Semykin <thesame.ml@gmail.com>

pkgname='deadbeef-decast-gtk3'
pkgdesc='Podcast subscription plugin for DeaDBeeF audio player'
url='https://bitbucket.org/thesame/decast'
pkgver=0.1
pkgrel=1
_commit='9ffd6d6dfb14'
arch=('i686' 'x86_64')
license=('ZLIB')
depends=('deadbeef' 'libxml2' 'curl' 'gtk3')
source=("https://bitbucket.org/thesame/decast/get/${_commit}.tar.gz")
md5sums=('81ae198e078c30ce777557412e707043')

prepare () {
    export \
        GTKVER=3 \
        PREFIX=/usr \
        DESTDIR="${pkgdir}/usr/lib/deadbeef"
}

build () {
    cd "${srcdir}/thesame-decast-${_commit}"
    make
}

package () {
    cd "${srcdir}/thesame-decast-${_commit}"
    make install
}

