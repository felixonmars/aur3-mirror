#Maintainer: Piotr Gorski <sir_lucjan@bridgelinux.pl>

pkgname=mate-calc-1.7
_pkgname=mate-calc
pkgver=1.7.0
pkgrel=2
pkgdesc="Calculator for the Mate desktop environment"
url="http://mate-desktop.org"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('LGPL' 'GPL')
depends=('desktop-file-utils' 'gtk2')
makedepends=('flex' 'bison' 'mate-common' 'mate-doc-utils' 'perl-xml-parser')
options=('!emptydirs' '!libtool')
groups=('mate-extras')
source=(http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz)
conflicts=(mate-calc)
replaces=(mate-calc)
provides=('mate-calc')
sha1sums=('36944008b3e662b8f32602a6fdfe9f0d371053e3')
install=${_pkgname}.install

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    ./autogen.sh \
        --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
