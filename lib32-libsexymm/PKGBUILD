# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: allspark

pkgname=lib32-libsexymm
pkgver=0.1.9
pkgrel=5
pkgdesc="C++ bindings for libsexy (32 bit)"
arch=('x86_64')
license=('GPL')
url="http://osiris.chipx86.com/projects/libsexy"
depends=('lib32-gtkmm' 'lib32-libsexy' 'libsexymm')
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://releases.chipx86.com/libsexy/libsexymm/libsexymm-${pkgver}.tar.gz)
md5sums=('77c8ae69084e478a6b090ec6e5ae26bf')

build() {
  cd ${srcdir}/libsexymm-${pkgver}
  ./configure --prefix=/usr --disable-static \
  	--libdir=/usr/lib32 CXX='g++ -m32'
  make
}

check() {
  cd ${srcdir}/libsexymm-${pkgver}
  make -k check
}

package() {
  cd ${srcdir}/libsexymm-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/{include,share}
}
