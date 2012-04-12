# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=gradm
pkgver=2.9
_timestamp=201202232055
pkgrel=2
pkgdesc="Administrative interface for the grsecurity Role Based Access Control system"
arch=('i686' 'x86_64')
url="http://grsecurity.net/"
license=('GPL2')
depends=('pam')
source=("http://grsecurity.net/stable/${pkgname}-${pkgver}-${_timestamp}.tar.gz")
md5sums=('3b8aa9a4595f165a35167c718ab9e60c')

build() {
  cd "${srcdir}/${pkgname}2"
  sed -i -e "s/^CFLAGS :=/CFLAGS +=/" "Makefile"
  make
}

package() {
  cd "${srcdir}/${pkgname}2"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/dev/grsec > /dev/null
  rmdir "${pkgdir}"/dev > /dev/null
}

# vim:set ts=2 sw=2 et:
