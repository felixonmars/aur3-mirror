# Contributor: William Rea <sillywilly@gmail.com>
pkgname=tetringo
pkgver=0.3.1
pkgrel=1
pkgdesc="A clone of the Second Life game Tringo"
arch=('i686' 'x86_64')
url="http://www.chipx86.com/wiki/Tetringo"
license=('GPL')
depends=('glib2' 'sdl_ttf' 'sdl_image')
source=(http://releases.chipx86.com/tetringo/0.3.1/tetringo-$pkgver.tar.gz)
md5sums=('b1d49e2cc428f4d71a96f5bc030fb15c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
