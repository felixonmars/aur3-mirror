# Former Maintainer: Emmanuel 'guinness' Boudreault
# Current Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=libunistring
pkgver=0.9.3
pkgrel=4
pkgdesc="Library for manipulating Unicode strings and C strings."
url="http://www.gnu.org/software/libunistring/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
install=${pkgname}.install
source=(ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('db8eca3b64163abadf8c40e5cecc261f')
sha256sums=('610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}

# vim:set ts=2 sw=2 et:
