# Maintainer: attila589 <attila589 at gmail dot com>

pkgname=dfight
pkgver=0.2
pkgrel=1
pkgdesc="Multi-player 3D board game for Linux written using Clutter. It is inspired by a popular board game called Khet."
arch=(i686 x86_64)
url="http://www.busydoingnothing.co.uk/dfight/"
license=('GPL')
depends=('clutter' 'hicolor-icon-theme')
source=(http://www.busydoingnothing.co.uk/dfight/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('b3d600d48fd40a8c000a674accc730e5')
sha256sums=('164d5ad77c9829d81f44f2df76472857f44ebe35ff65f11c29760f9939cc4572')
install=dfight.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
