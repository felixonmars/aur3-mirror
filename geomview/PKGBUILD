# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=geomview
pkgver=1.9.5
pkgrel=1
pkgdesc="Interactive 3D viewing program that lets you view and manipulate three-dimensional objects."
arch=('i686' 'x86_64')
url="http://www.geomview.org/"
license=('GPL2')
depends=('glu' 'lesstif' 'mesa')
optdepends=('xpdf: for viewing Manual in PDF')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('98ada147dfcbabca7c48137590e74a85')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
