# $Id: PKGBUILD 75959 2012-09-07 10:04:58Z lcarlier $
# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

_pkgbasename=alsa-lib
pkgname=libx32-${_pkgbasename}
pkgver=1.0.26
pkgrel=1.1
pkgdesc="An alternative implementation of Linux sound support (x32 ABI)"
arch=('x86_64')
url="http://www.alsa-project.org"
depends=('libx32-glibc' $_pkgbasename)
makedepends=('gcc-multilib-x32')
license=('GPL')
options=(!libtool)
source=(ftp://ftp.alsa-project.org/pub/lib/${_pkgbasename}-$pkgver.tar.bz2)
md5sums=('2dfa35d28471d721e592b616beedf965')

build() {
  cd $srcdir/${_pkgbasename}-$pkgver
  export CC='gcc -mx32'
  export PKG_CONFIG_PATH=/usr/libx32/pkgconfig
  ./configure --prefix=/usr --libdir=/usr/libx32 --disable-python
  make
}

package() {
  cd $srcdir/${_pkgbasename}-$pkgver
  make DESTDIR=$pkgdir install

  # Clean up libx32 package
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
