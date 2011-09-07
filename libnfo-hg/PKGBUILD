# Contributor: Uwe Strempel <u.strempel@googlemail.com>
pkgname=libnfo-hg
pkgver=131
pkgrel=2
pkgdesc="A .NFO file reader/writer."
arch=('i686' 'x86_64')
url="http://hg.geexbox.org/"
license=('LGPL')
depends=('libxml2' )
makedepends=('make' 'mercurial' 'pkgconfig')
optdepends=()
provides=('libnfo')
conflicts=('libnfo')
source=()
md5sums=()
_hgroot="http://hg.geexbox.org/"
_hgrepo="libnfo"

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
