# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xtrojka
pkgver=1.2.3
_pkgver=123
pkgrel=2
pkgdesc="An X11 version of the old Tetris-like game called Trojka"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?XTrojka"
license=('custom')
depends=('libxaw')
install="${pkgname}.install"
source=("http://www.ibiblio.org/pub/Linux/games/arcade/tetris/${pkgname}${_pkgver}.tar.gz"
        "00-${pkgname}.patch"
        "01-makefile.patch"
        "${pkgname}.desktop")
md5sums=('58f66c2e59205312af4dcd128a6a4040'
         'a71db81c15b120df9f03f9f11b3555dd'
         'e87843236136d4a4fe5ff9e580896238'
         '1b72cff02fb2c0e44f145e536320f740')

build() {
  cd "${srcdir}/${pkgname}${_pkgver}"

  # Apply patches
  patch -Np1 -i ../00-${pkgname}.patch
  patch -Np1 -i ../01-makefile.patch

  cp XTrojka.uk XTrojka
  make
}

package() {
  cd "${srcdir}/${pkgname}${_pkgver}"

  # Install game files
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -dm775 -g games "${pkgdir}/var/lib/${pkgname}"

  # Install a desktop entry
  install -Dm644 pixmaps/app_icon "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a man page and license
  install -Dm644 ${pkgname}.man "${pkgdir}/usr/share/man/man6/${pkgname}.6"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
