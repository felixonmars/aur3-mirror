# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libcfgparser
pkgver=1.1.2
pkgrel=1
pkgdesc="Configuration reader C++ library"
arch=('i686' 'x86_64')
url="http://cfgparser.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('libtool' 'libdbglog' 'patch')
source=(http://downloads.sourceforge.net/cfgparser/$pkgname-$pkgver.tar.bz2
        cfgparser-$pkgver.patch)
md5sums=('0633266e04c9889655c728b2f165d0f9'
         'e81010a8571b0b9d00c6c69219472cf0')

prepare() {
  cd "${srcdir}"/cfgparser-$pkgver

  patch -Np1 -i "${srcdir}"/cfgparser-$pkgver.patch
}

build() {
  cd "${srcdir}"/cfgparser-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/cfgparser-$pkgver

  make DESTDIR="${pkgdir}" install
}
