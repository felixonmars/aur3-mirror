# Maintainer: Alex Weil <ajonat at gmail dot com>

pkgname=quitcount
pkgver=2.0
pkgrel=1
pkgdesc="Simple counter showing your gains since you quit smoking"
arch=('i686' 'x86_64')
url="http://quitcount.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'libunique' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'diffutils' 'intltool')
options=('!libtool' '!emptydirs')
install="${pkgname}.install"
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('492ea6a7deb23bd64d5912cf6aa2f229')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
