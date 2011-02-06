# Maintainer: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=scrupp
pkgver=0.4
pkgrel=1
pkgdesc="A 2D engine using OpenGL controlled by external Lua scripts"
arch=(i686)
url="http://scrupp.sourceforge.net"
license=('MIT')
depends=('lua' 'physfs' 'gtk2' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'mesa')
makedepends=('pkgconfig')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.bz2")
md5sums=('a99d635b63b72737c923443e4a77a5e7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $startdir/COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE  
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
