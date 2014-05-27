# $Id$
# Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=libidn2
pkgver=0.9
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications"
url="http://www.gnu.org/software/libidn/"
arch=('i686' 'x86_64')
license=('GPL3' 'LGPL')
depends=('glibc')
makedepends=()
source=(ftp://alpha.gnu.org/gnu/libidn/${pkgname}-${pkgver}.tar.gz)
install=libidn2.install
sha1sums=('f979ad9b8ea893617fa16de2158c5bf1a86d4753')
	
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
