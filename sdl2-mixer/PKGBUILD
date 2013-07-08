#Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=sdl2-mixer
pkgver=2.0.0
pkgrel=4
pkgdesc="SDL2 mixer libraries"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=(sdl2)
optdepends=(libvorbis flac fluidsynth libmikmod)
provides=(sdl2_mixer)
options=(!libtool)
source=("http://www.libsdl.org/tmp/SDL_mixer/release/SDL2_mixer-${pkgver}.tar.gz")
sha256sums=('24f110a15f841071bcdd70259d4da1f4caf67dd54926d2667297b0cf198acaa0')

build() {
  cd "${srcdir}/SDL2_mixer-${pkgver}/"
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${srcdir}/SDL2_mixer-${pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
## vim:set ts=2 sw=2 et:
