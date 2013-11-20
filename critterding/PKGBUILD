# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Henri Valta <cg at jakorasia dot info>

pkgname=critterding
pkgver=beta14
pkgrel=1
pkgdesc='A Petri dish universe in 3D that demonstrates evolving artificial life'
arch=('i686' 'x86_64')
url='http://critterding.sourceforge.net/'
license=('GPL')
depends=('qt4' 'sdl' 'boost-libs')
makedepends=('cmake' 'gendesk' 'boost')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/sources/${pkgname}-${pkgver}.tar.bz2")
md5sums=('6922459f8cce31088928dc3315d48a2c')
_categories=Game

# uncomment for debug build
#options=(debug !strip)

build() {
  cd "${srcdir}"
  gendesk # Generate desktop file 
  cd "${pkgname}-${pkgver}"

  # comment for debug build
  CXXFLAGS="-march=native -Ofast -w -pipe" cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr 
./

  # uncomment for debug build
  #CXXFLAGS="-Og -Wall -Wextra -pipe" cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ./

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Copy desktop file and icon
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

