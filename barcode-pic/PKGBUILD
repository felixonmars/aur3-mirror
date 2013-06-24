# $Id$
# Maintainer: Connor Prussin <cprussin@bci-incorporated.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=barcode
pkgname=barcode-pic
pkgver=0.99
pkgrel=1
pkgdesc="A tool to convert text strings to printed bars with position-independent code (PIC) flag"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/barcode/"
license=('GPL')
depends=('glibc')
provides=('barcode')
conflicts=('barcode')
install=barcode.install
source=("ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
md5sums=('cdc504ee1020e27fbfeebcb0718de054')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  CFLAGS="$CFLAGS -fPIC" ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
}
