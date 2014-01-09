# Maintainer: Bastien Dejean <nihilhill@gmail.com>

_pkgname=mldonkey
pkgname=${_pkgname}-bskv-cvs
pkgver=20140108
pkgrel=1
pkgdesc='A multi-network P2P client, CVS version'
arch=('i686' 'x86_64')
url="http://${_pkgname}.sourceforge.net"
license=('GPL')
depends=('zlib')
makedepends=('ocaml' 'cvs')
provides=("$_pkgname")
conflicts=("$_pkgname")
cvsroot=":pserver:anonymous@cvs.savannah.nongnu.org:/sources/${_pkgname}"

pkgver() {
    date +%Y%m%d
}

prepare() {
    if [ -d "$_pkgname" ] ; then
        cd "$_pkgname"
        cvs -z3 update -d
    else
        cvs -z3 -d "$cvsroot" checkout -P "$_pkgname"
    fi
}

build() {
    cd "$_pkgname"
    ./configure --prefix=/usr --enable-minimum
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
