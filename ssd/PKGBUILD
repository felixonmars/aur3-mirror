# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ssd 
pkgver=0.40
pkgrel=1
pkgdesc="Sawfish session dialogue"
url="http://download.tuxfamily.org/sawfish/Extras"
arch=('any')
license=('GPL')
depends=('sawfish')
source=("http://download.tuxfamily.org/sawfish/Extras/$pkgname-$pkgver.tar.bz2")
sha1sums=('876f87dff42fd186d3be5dfb5f8ab5d6ca20dfd4')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
