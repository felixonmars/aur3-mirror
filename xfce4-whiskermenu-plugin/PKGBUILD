# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=xfce4-whiskermenu-plugin
pkgver=1.4.1
pkgrel=1
pkgdesc="Alternate Xfce menu"
arch=('i686' 'x86_64')
url="http://gottcode.org/${pkgname}/"
license=('GPL2')
depends=('xfce4-panel')
makedepends=('cmake')
install=${pkgname}.install
source=(http://gottcode.org/${pkgname}/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('da17766c95c7939c2b9feb695a34c430')
sha256sums=('b541adef6e6683f44e291d21e089e5583a95f4387dabc3f512c7773bdbe17d3e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
}
