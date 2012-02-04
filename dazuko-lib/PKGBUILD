# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=dazuko-lib
pkgver=2.3.4
pkgrel=1
pkgdesc="The Dazuko library"
arch=('i686' 'x86_64')
url="http://www.dazuko.org/"
license=('GPL')
source=(http://www.dazuko.org/files/dazuko-${pkgver}.tar.gz)
md5sums=('14ae194714584944b983845793daf2a4')

build() {
  cd ${startdir}/src/dazuko-${pkgver}/
  ./configure --with-library --without-module --without-example-c
  make -C library || return 1
  install -D -m644 dazukoio.h ${startdir}/pkg/usr/include/dazukoio.h
  install -D -m644 library/libdazuko.a ${startdir}/pkg/usr/lib/libdazuko.a
}

# vim:set ts=2 sw=2 et:
