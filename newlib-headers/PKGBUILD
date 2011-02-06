# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=newlib-headers
pkgver=1.17.0
pkgrel=1
pkgdesc="Newlib is a C library intended for use on embedded systems."
arch=('any')
url="http://sourceware.org/newlib/"
license=('GPL')
source=(ftp://sources.redhat.com/pub/newlib/newlib-${pkgver}.tar.gz)

md5sums=('9c345928b4f600a211ddc5a6072f8337')
sha256sums=('b7c8135f7dbff0269436da26917d9f01fe33f4da0f37c07c3f55066cba80274e')

build() {
 mkdir -p ${pkgdir}/usr/include/newlib/
 cp -r ${srcdir}/newlib-${pkgver}/newlib/libc/include ${pkgdir}/usr/include/newlib/libc
}
