# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>

pkgname=glaxium
pkgver=0.5
pkgrel=3
pkgdesc="An OpenGL-based space-ship shoot-em-up styled game"
arch=('i686' 'x86_64')
url="http://xhosxe.free.fr/glaxium/"
license=('GPL')
depends=('freeglut' 'libpng' 'libxmu' 'sdl_mixer')
source=("http://xhosxe.free.fr/${pkgname}/${pkgname}_${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}-makefile.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('ea6d6f8b4ebb7c73b74af64d83f45cb7'
         'c32c453b6dcb6d845a4fa1ee89aad908'
         '13e6f6d5c4665983ce13d549779bb111'
         '6defd442fb0a1b482e95bcad5785b7d4'
         'c55edcd806e5852cabaf6dce2bfc63ad')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # Apply patches
  patch -Np1 -i "../${pkgname}.patch"
  patch -Np1 -i "../${pkgname}-makefile.patch"

  # Compile
  ./configure --prefix=/usr --mandir=/usr/share/man CFLAGS=""
  make LDFLAGS="-lm -lstdc++"
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # Install game files
  make DESTDIR="${pkgdir}" install

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
