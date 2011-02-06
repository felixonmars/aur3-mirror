# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
pkgname=construo
pkgver=0.2.2
pkgrel=4
pkgdesc="2D construction program for objects which consist of rods and springs"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/construo/"
license=('GPL2')
depends=('freeglut' 'zlib')
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz includes.patch)
md5sums=('c18144898f98929b67245c5f703f9f39'
         '355fb9f896a042778429bd16c7f2acd3')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < ../includes.patch
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" bindir="/usr/bin" install
  mv "$pkgdir/usr/share/games/$pkgname" "$pkgdir/usr/share/$pkgname"
  rm -fr "$pkgdir/usr/share/games"
}
