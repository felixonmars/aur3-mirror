# Contributor: Uwe Strempel <u.strempel@googlemail.com>
pkgname=libvalhalla-hg
pkgver=727
pkgrel=2
pkgdesc="A tiny media scanner library."
arch=('i686' 'x86_64')
url="http://hg.geexbox.org/libvalhalla"
license=('LGPL')
depends=('libexif' 'libnfo-hg' 'ffmpeg')
makedepends=('mercurial')
optdepends=()
provides=('libvalhalla')
conflicts=('libvalhalla')
source=()
md5sums=()
_hgroot="http://hg.geexbox.org/libvalhalla"
_hgrepo="libvalhalla"

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

    ./configure --prefix=/usr  --disable-grabber-nfo || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg install

    rm -rf ${startdir}/src/${_hgrepo}-build
}
