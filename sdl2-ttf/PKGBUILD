# Maintainer: Clément Guérin <geecko.dev@free.fr>

pkgname=sdl2-ttf
pkgver=2.0.12
pkgrel=1
pkgdesc="SDL2 ttf libraries"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=(sdl2 freetype2)
makedepends=(cmake)
optdepends=()
provides=(sdl2_ttf)
options=(!libtool)
source=("http://www.libsdl.org/tmp/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz")
sha256sums=('ca666818e8d95bc3a113ceaf5099ed50befd23ca39205edbadca69e051bd9e0c')

build() {
  cd "${srcdir}/SDL2_ttf-${pkgver}/"
  ./autogen.sh
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${srcdir}/SDL2_ttf-${pkgver}/"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
## vim:set ts=2 sw=2 et:

