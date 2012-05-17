# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=bk-terak-emu
pkgver=2005.05.12
pkgrel=2
pkgdesc="An emulator of the BK-0010/0011M and Terak-8510/a computers"
arch=('i686' 'x86_64')
url="http://bk-terak-emu.sourceforge.net/"
license=('GPL' 'custom')
depends=('sdl')
makedepends=('netpbm')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}.${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "LICENSE_PDP11_EMU")
md5sums=('8f97d48abe46323ab1ca05515900418b'
         'ff5c36f8aa8be4613cbda40553213a7b'
         '87a12769a9bd540a44c8177fa6da57bf')

build() {
  cd "${srcdir}"
  make
}

package() {
  cd "${srcdir}"

  # Install binaries
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 bk maketape readtape "${pkgdir}/usr/bin"

  # Install ROMs
  mkdir -p "${pkgdir}/usr/share/bk"
  install -m644 Rom/*.ROM "${pkgdir}/usr/share/bk"

  # Install a desktop entry
  install -Dm644 bk.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install readme and license
  install -Dm644 README.html "${pkgdir}/usr/share/doc/${pkgname}/README.html"
  install -Dm644 ../LICENSE_PDP11_EMU "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_PDP11_EMU"
}
