# Contributor: gucong <gucong43216@gmail.com>

pkgname=tsito
pkgver=0.8.4
pkgrel=2
pkgdesc="A Xiangqi (Chinese chess) engine and command line interface"
arch=('i686' 'x86_64')
license=('custom')
url="http://xiangqi-engine.sourceforge.net/tsito.html"
depends=()
source=(http://ncu.dl.sourceforge.net/project/xiangqi-engine/xiangqi-engine/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('198b7313067959f7530d569ca9b48a1e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/<string>/<string.h>/g' src/Board.cpp
  ./configure --prefix=/usr || return 1
  make || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  make DESTDIR="$pkgdir" install || return 1
}