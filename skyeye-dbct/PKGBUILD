# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=skyeye-dbct
pkgver=1.2.8_rc1
pkgrel=2
pkgdesc="An emulator which supports various ARM platforms with DBCT"
arch=('i686')
url="http://www.skyeye.org/"
license=('GPL')
depends=('gtk2')
makedepends=('gcc3')
source=(http://downloads.sourceforge.net/project/skyeye/skyeye/skyeye-${pkgver}/skyeye-${pkgver}.tar.gz)
md5sums=('b8875d074cc481edbd07d22532ee09cc')

build() {
  cd ${srcdir}/skyeye-${pkgver}
  #sed -i "s/^CC = gcc/CC = gcc-3.3/" Makefile || return 1
  ./configure --sysconfdir=/usr/share --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
