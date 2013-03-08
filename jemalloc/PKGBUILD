# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=jemalloc
pkgver=3.3.1
pkgrel=1
pkgdesc="General-purpose scalable concurrent malloc(3) implementation"
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.canonware.com/jemalloc/"
depends=('glibc')
makedepends=('autoconf' 'make')
source=(http://www.canonware.com/download/jemalloc/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a899c330f6cd69e150bfe7bca276a291')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man 
  make || return 1
 }
 package() { 
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
