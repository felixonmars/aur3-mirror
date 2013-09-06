# Maintainer: Florian Kellmer <florian@kellmer.net>

pkgname=pipcalc
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple IP calculator"
arch=('i686' 'x86_64')
url="http://www.pizzashack.org/pipcalc/"
license=('GPL')
depends=('glibc')
source=('http://www.pizzashack.org/pipcalc/pipcalc-1.1.0.tar.gz')
md5sums=('b8e6ccf29a93ade7bb247f6622202882') #generate with 'makepkg -g'


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
