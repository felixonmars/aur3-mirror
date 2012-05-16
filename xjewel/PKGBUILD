# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>

pkgname=xjewel
pkgver=1.6
pkgrel=4
pkgdesc="A falling blocks game like Tetris and Sega Columns"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?XJewel"
license=('custom')
depends=('libx11')
install="${pkgname}.install"
source=("http://www.ibiblio.org/pub/Linux/games/arcade/tetris/${pkgname}-linux-src.tar.gz"
        "00-${pkgname}.patch"
        "01-makefile.patch"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "LICENSE")
md5sums=('68afaa59f0c7fb200d998f6a6162b684'
         '1e6e34a34dee9e7cf23225cae070e443'
         '774a18788756ba14f744957b3e9a1083'
         'fa467faf297a87e1e5c502935fc9740f'
         '03b0a9adeda8b3d74afa2dd7ca9d7e21'
         'ec94e3b7cc14edba9d2930bdf42ce4a2')

build() {
  cd "${srcdir}/${pkgname}"

  # Apply patches
  patch -Np1 -i ../00-${pkgname}.patch
  patch -Np1 -i ../01-makefile.patch

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install game files
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -dm775 -g games "${pkgdir}/var/lib/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation and license
  install -Dm644 ${pkgname}.man "${pkgdir}/usr/share/man/man6/${pkgname}.6"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
