# Maintainer: perlawk

pkgname=olena
pkgver=2.0
pkgrel=1
pkgdesc="Olena is a platform dedicated to image processing, a C++ library. Features many tools to easily perform image processing tasks." 
arch=('i686' 'x86_64')
url="https://www.lrde.epita.fr/wiki/Home"
license=('GPL')
depends=()
source=( "https://www.lrde.epita.fr/dload/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")

md5sums=('3085eb29bd37d8b3c222519ba4e44adb')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/usr install
}

