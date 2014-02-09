# $Id: PKGBUILD 201383 2013-12-10 12:36:07Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=bison27-extra
_pkgname=bison
pkgver=2.7
pkgrel=1
pkgdesc="The GNU general-purpose parser generator"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.gnu.org/software/bison/bison.html"
depends=('glibc' 'm4' 'sh')
groups=('base-devel')
options=('staticlibs')
install=bison.install
source=(ftp://ftp.gnu.org/gnu/bison/${_pkgname}-${pkgver}.tar.xz{,.sig})
sha256sums=('43d8c5c466486031d5e7195a152ff49651ccac91599692e788b5ec5b693ca7fd'
            'SKIP')
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}  
  ./configure --prefix=/usr/local/bison27 --datadir=/usr/local/bison27/share
  make V=1
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
