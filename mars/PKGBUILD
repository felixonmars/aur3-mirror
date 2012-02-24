# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte__gmail>

pkgname=mars
pkgver=0.2.1
pkgrel=2
pkgdesc="'Mars, Land of No Mercy' is a turn-based strategy game with isometric graphic"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mars/"
license=('GPL' 'CCPL:by-nc-sa' 'ZLIB')
depends=('libgl' 'sdl_image' 'sdl_ttf')
makedepends=('scons')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('c86674cd1fd6d0045e43218d929eb391'
         '06aa9ee687c5d7308f34e2da6be586ce'
         '7a7c316896e74f6f94a6f77df0f42fa9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  scons build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  scons root="${pkgdir}" prefix="/usr" install

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install licenses and readme
  sed -n "8,18p" README > LICENSE
  sed -n "449,468p" src/xml/tinyxml/readme.txt > LICENSE_tinyxml
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE{,_tinyxml} "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
