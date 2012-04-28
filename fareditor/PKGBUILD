# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fareditor
pkgver=2.0
pkgrel=1
pkgdesc="An editor for creating and manipulating .far files used by Cytadela"
arch=('i686' 'x86_64')
url="http://cytadela.sourceforge.net/"
license=('GPL3')
depends=('qt')
source=("http://downloads.sourceforge.net/cytadela/fareditor-2.0.tar.bz2"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('dfe5ef40017fd78747cf72fc7c01554d'
         '79b58cb8fe6f629562745b8d8b90ba51'
         'c892df6621784d8ea104b33c309c7d72')

build() {
  cd "${srcdir}/FarEditor"
  qmake
  make
}

package() {
  cd "${srcdir}/FarEditor"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
