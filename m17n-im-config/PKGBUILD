# Maintainer: Stefan Husmann <stefan-husmann@t-online.de
pkgname=m17n-im-config  
pkgver=0.9.0
pkgrel=1 
pkgdesc="Configure m17n input methods"
url="http://www.m17n.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('m17n-lib' 'gtk2')
source=(http://www.m17n.org/m17n-lib-download/$pkgname-$pkgver.tar.gz)
md5sums=('dfb1812d604c5b2392ebb7e47034c3f9')
options=('!libtool')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}