# Maintainer: Dane Elwell <dane[dot]elwell<at>gmail[dot]com>
pkgname=polygraph
pkgver=4.3.1
pkgrel=1
pkgdesc="Tool for testing caching proxies, accelerators, content filters, etc."
arch=(i686 x86_64)
url="http://www.web-polygraph.org"
license=(GPL)
depends=(gnuplot openssl zlib ncurses)
source=(http://www.web-polygraph.org/downloads/srcs/$pkgname-$pkgver-src.tgz)
md5sums=('ced2ccf1c08c3068091f80de59b7be7a')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
