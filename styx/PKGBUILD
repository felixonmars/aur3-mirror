# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=styx
pkgver=2.0.1
pkgrel=1
pkgdesc="A scanner and parser generator designed to address some shortcomings of the traditional lex/yacc combination."
arch=('i686' 'x86_64')
url="http://speculate.de/styx/"
license=('GPL2' 'LGPL')
source=("http://speculate.de/styx/$pkgname-$pkgver.tar.gz")
md5sums=('3d3a2b0a4a50df4f62b6c5e6cafbf72b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no \
              --datarootdir=/usr/share/$pkgname \
              --includedir=/usr/include/$pkgname
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
