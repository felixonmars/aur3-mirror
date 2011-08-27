# Contributor: Uwe Strempel <u.strempel@googlemail.com>
pkgname=libplayer-hg
pkgver=1206
pkgrel=1
pkgdesc="A multimedia A/V abstraction layer API."
arch=('i686' 'x86_64')
url="http://libplayer.geexbox.org/"
license=('LGPL')
depends=('vlc' 'xine-lib' 'mplayer')
makedepends=('mercurial')
optdepends=()
provides=('libplayer')
conflicts=('libplayer')
source=()
md5sums=()
_hgroot="http://hg.geexbox.org/libplayer"
_hgrepo="libplayer"

build() {
    cd ${startdir}/src

    if [ -d ${_hgrepo} ]; then
        cd ${startdir}/src/${_hgrepo}
        hg pull -u
    else
        hg clone ${_hgroot}${_hgrepo} || return 1
        cd ${startdir}/src/${_hgrepo}
    fi

    msg "Mercurial checkout done or server timeout"
    msg "Starting make..."

    cp -R ${startdir}/src/${_hgrepo} ${startdir}/src/${_hgrepo}-build
    cd ${startdir}/src/${_hgrepo}-build

    ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg install

    rm -rf ${startdir}/src/${_hgrepo}-build
}
