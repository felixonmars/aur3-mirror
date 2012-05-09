# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=hamurabi
pkgver=0.0.2
pkgrel=1
pkgdesc="A C99 implementation of the classic BASIC game"
arch=('i686' 'x86_64')
url="https://github.com/blt/hamurabi"
license=('MIT')
depends=('glibc')
source=("https://github.com/blt/hamurabi/tarball/master")
md5sums=('4d9171c6bf747c2ab0cd0b12ecd1c610')

build() {
  cd "${srcdir}/blt-${pkgname}-994563d"
  aclocal && autoconf && autoheader && automake -a
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/blt-${pkgname}-994563d"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
