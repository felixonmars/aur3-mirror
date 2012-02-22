# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte__gmail>

pkgname=everborn
pkgver=20081117
pkgrel=1
pkgdesc="A turn-based multiplayer fantasy strategy game with real-time battles"
arch=('i686' 'x86_64')
url="http://everborn.sourceforge.net/"
license=('GPL2')
depends=('libgl' 'libpng' 'sdl_mixer')
source=("http://everborn.sourceforge.net/${pkgname}_gal${pkgver}src.tar.bz2"
        "http://everborn.sourceforge.net/${pkgname}_gal20080723data.tar.bz2"
        "${pkgname}.patch")
md5sums=('a54e14e8d40b495cb13bcf4efb31aed7'
         '4165d4fba7c2c97b32b0d8ead0a3966a'
         '48bea4c0091140bec4702255cbd44120')

build() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "../${pkgname}.patch"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r *.{game,ogg,png,raz} "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:
