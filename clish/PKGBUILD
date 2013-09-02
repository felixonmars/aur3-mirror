# Maintainer: Your Name <youremail@domain.com>
pkgname=clish
pkgver=0.7.3
pkgrel=1
pkgdesc="A modular framework for implementing a CISCO-like CLI"
arch=('i686', 'x86_64')
url="http://clish.sourceforge.net/"
license=('BSD')
depends=()
makedepends=()
checkdepends=()
source=('http://downloads.sourceforge.net/project/clish/clish/0.7.3/clish-0.7.3.tar.gz?r=http%3A%2F%2Fclish.sourceforge.net%2F&ts=1378147823&use_mirror=superb-dca2')
md5sums=('81e20f7a888bcd8e2280e37804d342e4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr/local
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/etc"
  cp -R "$srcdir/$pkgname-$pkgver/xml-examples" "$pkgdir/etc/clish"
}
