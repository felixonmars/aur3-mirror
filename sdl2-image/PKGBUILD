#Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=sdl2-image
pkgver=2.0.0
pkgrel=3
pkgdesc="SDL2 image libraries"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=(sdl2)
makedepends=(cmake)
optdepends=(libpng libtiff libjpeg libwebp)
provides=(sdl2_image)
options=(!libtool)
source=("http://www.libsdl.org/tmp/SDL_image/release/SDL2_image-${pkgver}.tar.gz")
sha256sums=('a005117a6122dbaec24eab29724582eed6e24e8a3081178fec77888d338cc0c3')

build() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
## vim:set ts=2 sw=2 et:
