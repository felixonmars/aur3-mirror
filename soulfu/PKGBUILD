# Contributor: Emmanuele Massimi <finferflu@gmail.com>

pkgname=soulfu
pkgver=1.5.2
pkgrel=1
pkgdesc="Secret of Ultimate Legendary Fantasy Unleashed"
arch=('i686')
url="http://www.soulfu.com"
license=('niceware')
depends=('sdl' 'sdl_net' 'mesa' 'libjpeg' 'libogg' 'libvorbis')
install=
source=(http://macdonellba.googlepages.com/$pkgname-$pkgver.tar.gz)
md5sums=('c51c2aeb659cd5207f3d1bbe33166c7c') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver/build/unix"

  make PREFIX="$pkgdir" || return 1
  make PREFIX="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
