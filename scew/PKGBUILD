# Maintainer: Your Name <maple.hl@gmail.com>
pkgname=scew
pkgver=1.1.7
pkgrel=1
pkgdesc="simple C expat wrapper"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/scew/"
license=('LGPL')
depends=('expat')
source=(http://savannah.nongnu.org/download/scew/scew-1.1.7.tar.gz)
sha256sums=('2b7b4d69723e1a6d550bbc294e68673d1c7c0d9825ce8a51415c46a565109a50')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
