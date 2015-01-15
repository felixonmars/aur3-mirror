# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=nuclearchess
pkgver=1.0.0
pkgrel=2
pkgdesc="Nuclear chess aka dead square chess."
arch=('i686' 'x86_64')
url="http://www.linux-games.com/nuclearchess/"
license=('GPL2')
depends=('sdl_image')
source=(http://www.linux-games.com/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('c36b0cec8ff1bf3525a12aaf8a9c53fe'
         'd9af784fcae9b9dd1b5e994a77ef8594')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr

  # Fix aclocal & automake(1.9)
  sed -i 's|-1.9||g' {src/,gfx/,}Makefile

  # Fix linking
  sed -i 's|-lSDL_image|-lSDL_image -lm|' {src/,}Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  # Desktop icon
  install -Dm644 gfx/anim1.png $pkgdir/usr/share/pixmaps/nuclearchess.png
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
