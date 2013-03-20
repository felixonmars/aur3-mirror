# Maintainer: Brandon Invergo <brandon@invergo.net>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=ballandpaddle
pkgver=0.8.1
pkgrel=3
pkgdesc="Extensible ball and paddle game that lets you script the events and attributes of the objects (balls, blocks, powerups, etc.) with GNU Guile."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ballandpaddle/"
license=(GPL)
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'guile')
madepends=('make')
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz
        01_info-direntry.diff
)
md5sums=('685c2eb372f0aedfcf0b6addd5b05355'
         '18bbd43024b4b8bf7cc52d08d2a1d116'
)
install=ballandpaddle.install

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  sed -i -e '1i#include <cstdlib>' src/settingsmanager.cpp
  patch -uN doc/ballandpaddle.texi ../01_info-direntry.diff
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" install
}
