# $Id$
# Maintainer : Paulo Viadanna <paulo@viadanna.net>

pkgname=libimobiledevice-ios7fix
pkgver=1.1.6
pkgrel=2
pkgdesc="Is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux. Includes usbmuxd and libplist."
url="http://libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
provides=('libimobiledevice')
conflicts=('libimobiledevice')
depends=('usbmuxd' 'gnutls' 'libgcrypt')
source=('http://www.libimobiledevice.org/downloads/libimobiledevice-1.1.6.tar.bz2')
md5sums=('274783651e9b772774cd9fed2fc52e08')

build() {
    cd libimobiledevice-1.1.6
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr
    make
}

package() {
    cd libimobiledevice-1.1.6
    make DESTDIR="$pkgdir" install
}
