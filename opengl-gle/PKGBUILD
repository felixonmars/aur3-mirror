# Contributor: Paul Colomiets at gmail dot com

pkgname=opengl-gle
pkgver=3.1.0
pkgrel=1
pkgdesc="The library consists of a number of C language subroutines for drawing tubing and extrusions in OpenGL"
arch=('i686' 'x86_64')
url="http://linas.org/gle/"
license=('GPL')
depends=()
source=(http://www.linas.org/gle/pub/gle-$pkgver.tar.gz)
md5sums=('da5b45c6906343d4a3672c3de35513ad')

build() {
  cd $srcdir/gle-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  install -d $pkgdir/usr/share
  mv $pkgdir/usr/man $pkgdir/usr/share/
}
