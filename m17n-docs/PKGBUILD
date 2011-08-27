# Maintainer: Stefan Husmann <stefan-husmann@t-online.de
pkgname=m17n-docs  
pkgver=1.5.5
pkgrel=1 
pkgdesc="Documentation for the m17n internationalization library"
url="http://www.m17n.org"
arch=('any')
license=('GPL')
source=(http://www.m17n.org/m17n-lib-download/$pkgname-$pkgver.tar.gz)
md5sums=('55335857be94e8100b47253e3153907b')
options=('docs')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --datadir=$pkgdir/usr/share/doc 
  sed -i '196d' Makefile
  make 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
  rmdir $pkgdir/usr/bin
}