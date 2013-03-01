# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=massxpert
pkgver=3.4.0
pkgrel=2
pkgdesc="A mass spectromic software suite based on Qt 4"
arch=('i686' 'x86_64')
url="http://massxpert.org/wiki/"
license=('GPL3')
depends=('qt4')
makedepends=('cmake')
source=("http://download.tuxfamily.org/${pkgname}/source/${pkgname}-${pkgver}.tar.bz2")
md5sums=('586ceeed2e9cbebcf77d8554c52e042d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix path to icon in the .desktop file
  sed -i "s/massxpert-icon-32.xpm/massxpert/" ${pkgname}.desktop

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS=-Wno-error=unused-but-set-variable
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 gui/images/massxpert-icon-64.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
