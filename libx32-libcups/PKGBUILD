# $Id: PKGBUILD 74675 2012-08-01 19:35:26Z bluewind $
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

_pkgbasename=libcups
pkgname=libx32-$_pkgbasename
pkgver=1.6.1
pkgrel=1.1
pkgdesc="The CUPS Printing System - client libraries (x32 ABI)"
arch=('x86_64')
license=('GPL')
url="http://www.cups.org/"
depends=(libx32-krb5 libx32-libtiff libx32-libpng $_pkgbasename)
makedepends=(gcc-multilib-x32)
source=(ftp://ftp.easysw.com/pub/cups/${pkgver}/cups-${pkgver}-source.tar.bz2 fix-libusb-configure.patch)
md5sums=('87ade07e3d1efd03c9c3add949cf9c00'
         '9cf39a66f21d1208a585367b25cf117b')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/cups-${pkgver}

  patch -p1 -i "$srcdir/fix-libusb-configure.patch"
  
  aclocal -I config-scripts
  autoconf -I config-scripts

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
     --disable-ldap --enable-raw-printing --disable-gssapi --disable-dbus \
     --enable-ssl=no --disable-gnutls --enable-threads --enable-libusb=no \
	 --disable-avahi \
     --with-optim="$CFLAGS" --libdir=/usr/libx32
  make
}

package() {
  cd ${srcdir}/cups-${pkgver}
  make BUILDROOT=${pkgdir} install-libs
}

