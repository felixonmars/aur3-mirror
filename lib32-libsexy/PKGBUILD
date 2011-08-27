# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: allspark

pkgname=lib32-libsexy
pkgver=0.1.11
pkgrel=4
pkgdesc="Doing naughty things to good widgets. (32 bit)"
arch=('x86_64')
license=('GPL')
url="http://chipx86.com/wiki/Libsexy"
depends=('lib32-gtk2' 'lib32-libxml2' 'libsexy')
makedepends=('iso-codes' 'gcc-multilib')
options=('!libtool')
source=(http://releases.chipx86.com/libsexy/libsexy/libsexy-${pkgver}.tar.gz)
md5sums=('33c079a253270ec8bfb9508e4bb30754')

build() {
  cd ${srcdir}/libsexy-${pkgver}
  ./configure --prefix=/usr --disable-static \
  	--libdir=/usr/lib32 CC='gcc -m32'
  make
}

check() {
  cd ${srcdir}/libsexy-${pkgver}
  make -k check
}

package() {
  cd ${srcdir}/libsexy-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/{include,share}
}
