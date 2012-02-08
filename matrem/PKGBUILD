# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=matrem
pkgver=1.0
pkgrel=1
pkgdesc="Artificial life simulator"
arch=('i686' 'x86_64')
url="http://www.romansland.nl/matrem/"
license=('GPL')
depends=('allegro4' 'gcc-libs')
source=("http://www.romansland.nl/matrem/${pkgname}-source.zip")
md5sums=('e930dce87df6cf797287e963aa380548')

build() {
  cd "${srcdir}"

  # Compile
  sed -i "s_/usr/share/games/matrem_/usr/share/matrem_" graphics.cpp
  make clean || return 1
  make || return 1
}

package() {
  cd "${srcdir}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -m644 *.bmp "${pkgdir}/usr/share/${pkgname}"

  # Install readme
  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}
