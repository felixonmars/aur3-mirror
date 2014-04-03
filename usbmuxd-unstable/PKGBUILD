# $Id$
# Maintainer : Paulo Viadanna <paulo@viadanna.net>

pkgname=usbmuxd-unstable
pkgver=1.0.9
pkgrel=1
pkgdesc="Is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux."
url="http://libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
provides=('usbmuxd')
conflicts=('usbmuxd')
depends=('libplist' 'gnutls' 'libgcrypt')
source=('http://www.libimobiledevice.org/downloads/libusbmuxd-1.0.9.tar.bz2')
md5sums=('3f1d4bd0c0a1a4d7bf96219e117ec499')

build() {
    cd libusbmuxd-1.0.9
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr
    make
}

package() {
    cd libusbmuxd-1.0.9
    make DESTDIR="$pkgdir" install
}
