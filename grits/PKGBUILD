# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=grits
pkgver=0.8
pkgrel=2
pkgdesc="Virtual Globe library using GTK+ and OpenGL"
arch=('i686' 'x86_64')
url="http://pileus.org/aweather/grits"
license=('GPL3')
depends=('gtk2' 'libsoup')
options=('!libtool')
source=(http://pileus.org/grits/files/$pkgname-$pkgver.tar.gz)
md5sums=('b723bc34b4657c70d177e3f2a9f51605')

prepare() {
  cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr LIBS=-lgmodule-2.0
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
