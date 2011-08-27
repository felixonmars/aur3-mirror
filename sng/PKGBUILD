# Maintainer: TDY <tdy@gmx.com>

pkgname=sng
pkgver=1.0.5
pkgrel=1
pkgdesc="A specialized markup language for representing PNG contents"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sng/"
license=('custom')
depends=('libpng')
makedepends=('xorg-server-utils')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('798502dcc90511d547549d9b3504b4af')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man \
      --with-rgbtxt=/usr/share/X11/rgb.txt
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
