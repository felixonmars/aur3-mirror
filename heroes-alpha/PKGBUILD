# Maintainer: Hubert Maraszek <marach5 at gmail dot com>
pkgname=heroes-alpha
pkgver=0.29c
pkgrel=1
pkgdesc="An advanced Nibbles clone - alpha version"
arch=('i686')
url="http://heroes.sourceforge.net/"
license=('GPL')
depends=('sdl_mixer' 'heroes-data')
optdepends=('heroes-sound-effects: sound effects'
            'heroes-sound-tracks: game music'
            'heroes-hq-sound-tracks: higher quality music')
conflicts=('heroes')
source=(http://heroes.sourceforge.net/dl/prereleases/heroes-$pkgver.tar.gz
        hedlite.patch)
md5sums=('b88f7fbe4d92aba36f095d3b7086ab74'
         '1e0e82f1108d35fc77336a4b841cbf58')

build() {
  cd "$srcdir/heroes-$pkgver"
  patch -f src/hedlite.c $srcdir/hedlite.patch
  
  ./configure --prefix=/usr --with-sdl --with-sdl-mixer
  make
}

package() {
  cd "$srcdir/heroes-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
