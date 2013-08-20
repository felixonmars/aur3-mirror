# Maintainer: DaZ <daz.roo+arch@gmail.com>
# Contributor: Joseph Xu <josephzxu@gmail.com>
pkgname=supercat
pkgver=0.5.5
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A program that colorizes text based on matching regular expressions/strings/characters"
url="http://supercat.nosredna.net"
license=('GPL')
makedepends=('gcc' 'make')
source=("http://supercat.nosredna.net/${pkgname}-${pkgver}.tar.gz")
md5sums=("baf637fa841fa069481f4aba6bf0d158")


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
