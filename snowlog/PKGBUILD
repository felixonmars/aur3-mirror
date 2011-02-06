# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=snowlog
pkgver=1.1.1
pkgrel=1
pkgdesc="An Apache access log browser and analyzer"
arch=('i686' 'x86_64')
url="http://kiza.kcore.de/software/snowlog/"
license=('GPL')
depends=('ncurses' 'pcre')
source=(http://kiza.kcore.de/software/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('fe2bfeb8bc1331cf0d00be53837ea81f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '46,49 s#man/man1#share/&#' Makefile
  make PREFIX="$pkgdir/usr" install
}
