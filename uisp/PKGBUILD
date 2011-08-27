# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Maintainer: Laszlo Papp <djszapi2 at gmail com>
pkgname=uisp
pkgver=20050207
pkgrel=4
pkgdesc="A tool for AVR which can interface to many hardware in-system programmers"
arch=('i686')
url="http://savannah.nongnu.org/projects/uisp/"
license=('GPL')
depends=('gcc-libs')
source=(http://savannah.nongnu.org/download/uisp/${pkgname}-${pkgver}.tar.gz)
md5sums=('b1e499d5a1011489635c1a0e482b1627')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i 's|^\(    char\* name\)|const \1|' src/Avr.h
  sed -i 's/8 + pgsz\[1\]/(&)/g' src/Stk500.C
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR=${pkgdir} install
}
