# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=beastieworker
pkgver=0.4
pkgrel=4
pkgdesc="A 3D sokoban-like game featuring Beastie"
arch=('i686' 'x86_64')
url="http://beastieworker.sourceforge.net"
license=('GPL')
depends=('mesa' 'sdl')
source=("http://downloads.sourceforge.net/${pkgname}/BeastieWorker-${pkgver}.tar.gz"
        "http://downloads.sourceforge.net/${pkgname}/BeastieWorker-levels-01_50.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.desktop"
        "${pkgname}.png")
md5sums=('cdb838c8cb38652d81fda81fd0787ee0'
         'b787a772b0db5b0fd1d07f611787ffcc'
         'ba8371033bf16cd5509243ae617c3343'
         '2cd7c23530cc4f53190b9740eb68685e'
         'e3096f36f791428204dbc593bdbd0906')

build() {
  cd "${srcdir}/BeastieWorker-${pkgver}"

  # Fix a compiler's flags and paths to data files
  patch -Np1 -i "../${pkgname}.patch"

  # Compile
  cd src
  make || return 1
}

package() {
  cd "${srcdir}/BeastieWorker-${pkgver}"

  # Install binary
  install -Dm755 BeastieWorker "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r model sounds textures ../levels "${pkgdir}/usr/share/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install readme
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
