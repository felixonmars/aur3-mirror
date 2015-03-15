# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=cdstatus
pkgver=0.97.03
pkgrel=3
pkgdesc="cd and cdrom diagnostic tool"
arch=("i686" "x86_64")
url="http://cdstatus.sourceforge.net/"
license=('GPL')
depends=("glibc")
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e3a8717a79bddc89312fe935cd908201')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
