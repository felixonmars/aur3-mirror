# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=gljewel
pkgver=1.1.1
pkgrel=1
pkgdesc="Swap one gem with an adjacent gem to form a chain of three or more gems."
arch=(i686 x86_64)
url="http://www.linuxmotors.com/gljewel/"
license=('GPL')
depends=('sdl')
source=(http://www.linuxmotors.com/gljewel/downloads/SDL_jewels-${pkgver}.tgz)

build() {
  cd "$srcdir/SDL_jewels-$pkgver"

  #Patch the source to use data files in /usr/share/gljewel/data
  #instead of trying to open thme from the same directory where
  #the executable is.
  sed -e "s|data/bigfont.ppm|/usr/share/gljewel/data/bigfont.ppm|g" -i gljewel.c
  sed -e "s|=\"data\"|=\"/usr/share/gljewel/data\"|g" -i sound.c
  make
}

package() {
  cd "$srcdir/SDL_jewels-$pkgver"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/gljewel"
  cp gljewel "${pkgdir}/usr/bin/"
  cp -r data "${pkgdir}/usr/share/gljewel/"
}

# vim:set ts=2 sw=2 et:
md5sums=('a80d36d1b2647df8d292029bd2c7d594')
