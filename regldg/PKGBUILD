# Maintainer: Nicolas LLOBERA <nllobera@gmail.com>
pkgname="regldg"
pkgver=1.0.0
pkgrel=2
arch=('i686' 'x86_64')
url="http://regldg.com"
license=('GPL')
pkgdesc="A regular expression (regex) grammar language dictionary generator."
source=("http://regldg.com/$pkgname-$pkgver.tar.gz")
md5sums=('2c6a7e83053e4ae163330484e3dc9701')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	install -D "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
