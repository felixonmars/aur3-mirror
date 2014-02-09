# $Id$
# Maintainer: pvg <pvg@poczta.fm>

pkgname=libgadu-devel
pkgver=1.12.0_rc2
pkgrel=1
pkgdesc="Gadu-Gadu protocol libraries - development version"
arch=('i686' 'x86_64')
url="http://libgadu.net/"
license=('LGPL2.1')
depends=('openssl')
provides=('libgadu=1.12.0')
conflicts=('libgadu')
source=("http://github.com/wojtekka/libgadu/releases/download/1.12.0-rc2/libgadu-1.12.0-rc2.tar.gz")
md5sums=('a2c98270b5dd750e64ad9bc64ed40800')

build() {
  cd "${srcdir}"/${pkgname//-devel/}-${pkgver//_/-}
  ./configure --prefix=/usr \
 	 --disable-static \
	 --enable-shared \
	 --with-pthread
  make
}

check() {
  cd "${srcdir}"/${pkgname//-devel/}-${pkgver//_/-}
  make check
}

package() {
  cd "${srcdir}"/${pkgname//-devel/}-${pkgver//_/-}
  make DESTDIR="${pkgdir}" install
}
