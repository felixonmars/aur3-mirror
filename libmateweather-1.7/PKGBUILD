# Maintainer: Piotr Gorski <sir_lucjan@bridgelinux.pl>

pkgname=libmateweather-1.7
_name=libmateweather
pkgver=1.7.0
pkgrel=3
pkgdesc="Provides access to weather information from the net"
url="http://mate-desktop.org"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('LGPL')
depends=('gtk2' 'libsoup' 'pygtk' 'python2-gobject2')
makedepends=('mate-common' 'perl-xml-parser')
options=('!emptydirs' '!libtool')
groups=('mate')
conflicts=(libmateweather)
replaces=(libmateweather)
provides=('libmateweather=1.6.2')
source=(http://pub.mate-desktop.org/releases/1.7/${_name}-${pkgver}.tar.xz)
sha1sums=('927dfc5ed3c20e93469aa6c1ce55800f40e24d0d')
install=${pkgname}.install

build() {
    cd ${srcdir}/${_name}-${pkgver}
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --enable-locations-compression
    make
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
