# $Id$
# Maintainer : Paulo Viadanna <paulo@viadanna.net>

pkgname=libplist-unstable
pkgver=1.11
pkgrel=1
pkgdesc="Is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux."
url="http://libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
provides=('libplist')
conflicts=('libplist')
source=('http://www.libimobiledevice.org/downloads/libplist-1.11.tar.bz2')
md5sums=('82de65f38cb2f0a9fd0839679b46072b')

build() {
    cd libplist-1.11
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr
    make
}

package() {
    cd libplist-1.11
    make DESTDIR="${pkgdir}" install
}
