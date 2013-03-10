# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
pkgname=tvkaistagui
pkgver=1.3.0
pkgrel=2
pkgdesc='GUI for tvkaista.fi'
arch=('i686' 'x86_64')
url='http://helineva.net/tvkaistagui/'
license=('GPL')
depends=('qt4')
optdepends=('vlc: default video player')
source=("http://helineva.net/tvkaistagui/tvkaistagui-${pkgver}-src.tar.gz")
md5sums=('0842ff66073a558487e939d2b27086a1')

build() {
  cd "${srcdir}/tvkaistagui-${pkgver}"
  qmake-qt4 CONFIG+=release src/tvkaista.pro
  make
}

package() {
  cd "${srcdir}/tvkaistagui-${pkgver}"
  install -Dm 755 "tvkaistagui" "${pkgdir}/usr/bin/tvkaistagui"
  install -Dm 644 "tvkaistagui.desktop" "${pkgdir}/usr/share/applications/tvkaistagui.desktop"
}

# vim:set ts=2 sw=2 et:
