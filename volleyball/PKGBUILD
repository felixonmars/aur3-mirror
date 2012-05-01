# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>

pkgname=volleyball
pkgver=0.8.6
pkgrel=4
pkgdesc="An arcade volleyball game"
arch=('i686' 'x86_64')
url="http://www.losersjuegos.com.ar/juegos/volleyball"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'volleyball-data')
source=("http://www.losersjuegos.com.ar/_media/juegos/volleyball/descargas/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('5f17ccefc08ead556a1afb35d1c95a3b'
         'f1a847c8a20eac7e5dbee7ba226fbdfa'
         'd0a435e86da69820ee6e935a5f00a7e2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  LDFLAGS=-lm ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install a desktop entry
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog README "${pkgdir}/usr/share/doc/${pkgname}"
}
