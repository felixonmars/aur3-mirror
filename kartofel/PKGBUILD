# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=kartofel
pkgver=1.2
pkgrel=3
pkgdesc="A puzzle game where you have to connect the numbered dots"
arch=('i686' 'x86_64')
url="http://kartofel.jfedor.org/"
license=('GPL' 'custom')
depends=('curl' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
install="${pkgname}.install"
source=("http://kartofel.jfedor.org/downloads/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.desktop")
md5sums=('4452da69e2e5c8f78ac22e234594dabf'
         'f5a142b3857480a0d0aeefae793a0919'
         '8ee614c8b9aa9ef2e23a3f91534b178f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r fonts images levels music sounds www "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -dm775 -g games "${pkgdir}/var/lib/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 images/icon256x256.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYRIGHT LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}"
}
