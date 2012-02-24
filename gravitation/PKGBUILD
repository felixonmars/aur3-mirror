# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=gravitation
pkgver=3
pkgrel=1
pkgdesc="A game about mania, melancholia, and the creative process by Jason Rohrer"
arch=('i686' 'x86_64')
url="http://hcsoftware.sourceforge.net/gravitation/"
license=('custom:public_domain')
depends=('gcc-libs' 'sdl')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/hcsoftware/Gravitation_v${pkgver}_UnixSource.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('824fa45502ea3c63d3113bac0876bbd9'
         'c4973bc5a049321da3c4f6ce99e498f4'
         '51afdc2ada48fb2b0c802d1a3ad72a82'
         'de952fd3e7a55c479fee76a2b9219a9f')

build() {
  cd "${srcdir}/Gravitation_v${pkgver}_UnixSource"

  sed -i "s_^./configure_echo 1 | ./configure_" runToBuild
  sed -i "s_-lSDL_-lSDL -pthread_" game5/gameSource/Makefile.GnuLinux
  ./runToBuild
}

package() {
  cd "${srcdir}/Gravitation_v${pkgver}_UnixSource"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -R graphics music settings Gravitation *.txt "${pkgdir}/opt/${pkgname}"

  # Set permissions
  chgrp -R games "${pkgdir}/opt/${pkgname}"
  chmod -R g+w "${pkgdir}/opt/${pkgname}"

  # Install launchers
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/Gravitation"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
