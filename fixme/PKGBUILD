# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fixme
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
depends=('gtk2' 'xdg-utils')
license=('GPL3')
pkgdesc="Unscramble a square matrix of numbered tiles to put them in order. "
url="http://www.kornelix.squarespace.com/fixme"
source=("http://kornelix.squarespace.com/storage/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('0183ba08769d3b2e68a94803ebc3e7d6')
build() {
  cd ${srcdir}/$pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
  make PREFIX=/usr CFLAGS+="-c $(pkg-config --cflags gtk+-2.0)" \
    LFLAGS+="`pkg-config --libs gtk+-2.0 gthread-2.0`"
  sed -i 's+^# ++' data/desktop 
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 data/desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/applications/kornelix-$pkgname.desktop
}
