# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=kuklomenos
pkgver=0.4.5
pkgrel=1
pkgdesc="An abstract shoot 'em up with minimalistic graphics and short game length"
arch=('i686' 'x86_64')
url="http://mbays.freeshell.org/kuklomenos/"
license=('GPL3' 'custom')
depends=('curl' 'sdl')
source=("http://mbays.freeshell.org/kuklomenos/src/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('e88729b2385c5c60e708d7ebba918a42'
         '320c55b55c05b16cae5a03ea3ea40da9'
         '589f36b7ab8da5642323d3fa57dde9e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/${pkgname}/sounds/Makefile.am"

  # Install a desktop entry
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation and licenses
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 sounds/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING_SOUNDS"
}
