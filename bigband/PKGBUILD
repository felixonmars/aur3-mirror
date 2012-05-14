# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=bigband
pkgver=1.3
pkgrel=1
pkgdesc="A program to compose real music for small ensembles"
arch=(i686 x86_64)
url="http://members.chello.nl/w.boeke/bigband/"
license=('GPL')
depends=('sdl_ttf' 'sdl_gfx' 'jack')
install="$pkgname.install"
source=("$url$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('87fc9f1bdb1e9fa89e0f98752952fe37'
         'ee3541004c2575767940199914135225')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # wrong file name for tune
  sed -i "s/l-boos/kitten-demo/" Makefile

  ./configure --fontdir /usr/share/fonts/TTF
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  make SH_DIR="$pkgdir/usr/share" BIN_DIR="$pkgdir/usr/bin" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
          "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 src/bb-icon.xpm \
          "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}

# vim:set ts=2 sw=2 et:
