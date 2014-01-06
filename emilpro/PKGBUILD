# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=emilpro
pkgver=3
pkgrel=1
pkgdesc="Graphical disassembler for a large number of instruction sets."
arch=('i686' 'x86_64')
url="http://www.emilpro.com/"
license=('GPL2')
depends=('curl' 'elfutils' 'gtkmm3' 'gtksourceviewmm' 'libxml++')
options=('!buildflags' '!makeflags')
source=(http://www.emilpro.com/$pkgname-$pkgver.tar.gz)
md5sums=('a95c92f12c04e02ccef5578019d8d19c')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  mkdir build
  cd build
  cmake ..
}

build() {
  cd $srcdir/$pkgname-$pkgver/build
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}