# Contributor: Carl Flippin <carlf@photocarl.org>

pkgname=libdbi-drivers-sqlite3
pkgver=0.8.3
pkgrel=1
pkgdesc="Database driver for libdbi (sqlite3)"
url="http://libdbi-drivers.sourceforge.net/"
license=(GPL)
depends=('libdbi' 'sqlite3')
makedepends=()
provides=('libdbi-drivers')
options=(!libtool)
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/project/libdbi-drivers/libdbi-drivers/libdbi-drivers-$pkgver-1/libdbi-drivers-$pkgver-1.tar.gz)
md5sums=('4de79b323162a5a7652b65b608eca6cd')

build() {
  cd $startdir/src/libdbi-drivers-$pkgver-1
  ./configure --prefix=/usr \
  	--disable-docs \
	--with-sqlite3 \
	|| return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
