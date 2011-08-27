# Contributor: Uwe Strempel <u.strempel@googlemail.com>
pkgname=libsvdrp-hg
pkgver=19
pkgrel=1
pkgdesc="Is an interface to VDR via SVDRP protocol."
arch=('i686' 'x86_64')
url="http://hg.geexbox.org/libsvdrp"
license=('LGPL')
depends=()
makedepends=('mercurial')
optdepends=()
provides=('libsvdrp')
conflicts=('libsvdrp')
source=()
md5sums=()
_hgroot="http://hg.geexbox.org/libsvdrp"
_hgrepo="libsvdrp"

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

    ./autogen.sh --prefix=/usr  || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg install

    rm -rf ${startdir}/src/${_hgrepo}-build
}
