# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=passage
pkgver=4
pkgrel=1
pkgdesc="An autobiographical pixelated art game by Jason Rohrer"
arch=('i686' 'x86_64')
url="http://hcsoftware.sourceforge.net/passage/"
license=('custom:public_domain')
depends=('gcc-libs' 'sdl')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/hcsoftware/Passage_v${pkgver}_UnixSource.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('1073316014082689990ed2f3790b0865'
         'd1c10c8f2c2d9dd7d104c07facb37fcb'
         '583e88ab2afb3e0a8133954765c6d503'
         '3c66bfbfadcfb51899e1a2d22736b392')

build() {
  cd "${srcdir}/Passage_v${pkgver}_UnixSource"

  sed -i "s_^./configure_echo 1 | ./configure_" runToBuild
  ./runToBuild
}

package() {
  cd "${srcdir}/Passage_v${pkgver}_UnixSource"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -R graphics music settings Passage *.txt "${pkgdir}/opt/${pkgname}"

  # Set permissions
  chgrp -R games "${pkgdir}/opt/${pkgname}"
  chmod -R g+w "${pkgdir}/opt/${pkgname}"

  # Install launchers
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/Passage"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
