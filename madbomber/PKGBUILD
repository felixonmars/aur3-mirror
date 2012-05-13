# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=madbomber
pkgver=0.2.5
pkgrel=3
pkgdesc="A clone of the classic Atari 2600 video game Kaboom"
arch=('i686' 'x86_64')
url="http://www.newbreedsoftware.com/madbomber/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
source=("ftp://ftp.tuxpaint.org/unix/x/${pkgname}/src/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('90772baaec90a10f6d9467bc4d3963a6'
         '45b715ba36848fc6469ce47534b00a51')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  mkdir -p "${pkgdir}/usr/bin"
  make BIN_PREFIX="${pkgdir}/usr/bin" \
       DATA_PREFIX="${pkgdir}/usr/share/${pkgname}" \
       install

  # Install a desktop entry
  install -Dm644 data/images/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/doc/${pkgname}"
}
