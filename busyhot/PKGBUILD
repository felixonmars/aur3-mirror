# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=busyhot
pkgver=2.0
pkgrel=1
pkgdesc="shows cpu-load and temperature"
url="http://kornelix.squarespace.com/dkopp"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk2' 'xdg-utils')
source=(http://kornelix.squarespace.com/storage/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('9f33103cf658de7b6d738d0d4c3d9419')

build() {
  cd $srcdir/$pkgname-$pkgver
  export PREFIX=/usr
  make CFLAGS+="-c $(pkg-config --cflags gtk+-2.0)" \
    LFLAGS+="`pkg-config --libs gtk+-2.0 gthread-2.0`"
  sed -i '8,9d' data/desktop
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 data/desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop 
  make MENUFILE1=$pkgdir/usr/share/applications/$pkgname.desktop \
    DESTDIR=$pkgdir install 
  rm $pkgdir/usr/share/applications/kornelix-$pkgname.desktop 
}
