# Contributor: Josef Lusticky <evramp@gmail.com>
pkgname=ultra-tic-tac-toe
pkgver=0.11.0
pkgrel=1
pkgdesc="A console board game package containing three games: Tic Tac Toe, Connect 4, and The K-Map Game."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ttt/"
license=('GPL')
makedepends=('make' 'gcc' 'binutils')
source=(http://downloads.sourceforge.net/ttt/uttt-${pkgver}.tar.gz)
md5sums=('c141c99bfe0327477055b5ecf91f6912')

build() {
  cd ${srcdir}/uttt-$pkgver
  ./configure --prefix=/usr
  make
  make prefix=${pkgdir}/usr install
}
