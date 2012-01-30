# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Travis Fickett <tfickett@ufl.edu>

pkgname=vertris
pkgver=0.3.2
pkgrel=5
pkgdesc="A simple cross-platform Tetris clone"
arch=('i686' 'x86_64')
url="http://vertris.googlepages.com/"
license=('GPL')
depends=('allegro4')
makedepends=('cmake')
source=("http://vertris.googlecode.com/files/${pkgname}-${pkgver}-src.zip")
md5sums=('012a9cc8836a1383c5eb23fc19ad8061')

build() {
  cd "${srcdir}"

  # Fix installation paths
  sed -i "s_images/_/usr/share/${pkgname}/images/_" src/output.c
  sed -i "s_sounds/_/usr/share/${pkgname}/sounds/_" src/output.c
  sed -i "s_hiscores.dat_/var/lib/${pkgname}/hiscores.dat_" src/state.c
  sed -i "s_\"preferences\"_\"/var/lib/${pkgname}/preferences\"_" src/state.c
  sed -i "s_vertris.sav_/var/lib/${pkgname}/vertris.sav_" src/state.c

  # Compile
  cmake . || return 1
  sed -i "s_\`allegro-config --libs\`_-L/usr/lib -lalleg_" \
    "src/CMakeFiles/${pkgname}.dir/link.txt"
  make || return 1
}

package() {
  cd "${srcdir}/dist"

  # Install a binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}/"{images,sounds}
  install -m644 images/* "${pkgdir}/usr/share/${pkgname}/images"
  install -m644 sounds/* "${pkgdir}/usr/share/${pkgname}/sounds"

  # Install user files
  mkdir -p "${pkgdir}/var/lib/${pkgname}"
  install -m666 hiscores.dat preferences vertris.sav "${pkgdir}/var/lib/${pkgname}"

  # Install a pixmap
  install -Dm644 "${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
}
