#Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-sdl2-image
pkgver=2.0.0
pkgrel=3
pkgdesc="SDL2 image libraries"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=(lib32-sdl2)
optdepends=(lib32-libpng lib32-libtiff lib32-libjpeg lib32-libwebp)
provides=(lib32-sdl2_image)
options=(!libtool)
source=("https://www.libsdl.org/projects/SDL_image/release/SDL2_image-${pkgver}.tar.gz")
sha256sums=('b29815c73b17633baca9f07113e8ac476ae66412dec0d29a5045825c27a47234')

build() {
  export CC='gcc -m32'
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/SDL2_image-${pkgver}/"
  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/SDL2_image-${pkgver}/"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "$pkgdir/usr/share/aclocal/" "$pkgdir/usr/include/" "${pkgdir}/usr/bin/"
}
## vim:set ts=2 sw=2 et:
