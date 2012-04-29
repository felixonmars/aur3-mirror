# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=tuxanci
pkgver=0.21.0
pkgrel=2
pkgdesc="A top-down two player shooting deathmatch"
arch=('i686' 'x86_64')
url="http://www.tuxanci.org/en/start"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'zziplib')
makedepends=('cmake')
source=("http://download.tuxanci.org/${pkgname}-${pkgver}.tar.bz2")
md5sums=('a9012b55bbac7e5f4ce7cd58022334e5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  sed -i "s/-lSDL /&-ldl /" "src/CMakeFiles/${pkgname}-${pkgver}.dir/link.txt"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make DESTDIR="${pkgdir}" install
  ln -s "/usr/bin/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  rm "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/${pkgname}.svg"

  # Install pixmap and .desktop file
  install -Dm644 "data/${pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -Dm644 "data/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
