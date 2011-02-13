# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=heroes
pkgver=0.21
pkgrel=1
pkgdesc="An advanced Nibbles clone"
arch=('i686')
url="http://heroes.sourceforge.net/"
license=('GPL')
depends=('sdl_mixer' 'heroes-data')
optdepends=('heroes-sound-effects: sound effects'
            'heroes-sound-tracks: game music'
            'heroes-hq-sound-tracks: higher quality music')
source=(http://prdownloads.sourceforge.net/heroes/$pkgname-$pkgver.tar.gz
        hedlite.patch
        menus.patch)
md5sums=('3238290f219bc978894ba472fac95298'
         '8ad75b26d00ea47268ec9ca160b94954'
         '048dbf47ec3797016c8fd653e2e371c8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -f src/hedlite.c $srcdir/hedlite.patch
  patch -f src/menus.c $srcdir/menus.patch
  
  ./configure --prefix=/usr --with-sdl --with-sdl-mixer
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
