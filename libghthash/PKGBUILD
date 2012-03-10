# libghthash
# http://www.bth.se/people/ska/sim_home/libghthash.html
# Maintainer: Amund Hov <amundh.hov@gmail.com>

pkgname=libghthash
pkgver=0.6.2
pkgrel=1
epoch=
pkgdesc="Generic Hash Table library which is meant to be easy to extend, portable, clear in its code and easy to use."
arch=(i686 x86_64)
url="http://www.bth.se/people/ska/sim_home/libghthash.html"
license=('GPL2')
makedepends=(gcc-libs)
source=(http://www.bth.se/people/ska/sim_home/filer/$pkgname-$pkgver.tar.gz)
md5sums=('6e3c637edf4f178d0790e5fa32d67184') #generate with 'makepkg -g'

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

