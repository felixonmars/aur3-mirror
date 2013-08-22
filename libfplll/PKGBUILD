
pkgname=libfplll
pkgver=4.0.4
pkgrel=1

pkgdesc="Implementations of the floating-point LLL reduction algorithm for euclidean lattices"
arch=('any')
url="http://perso.ens-lyon.fr/damien.stehle/fplll/"
license=('LGPL')

depends=('gmp' 'mpfr')
provides=("fplll=$pkgver")
conflicts=('fplll')

source=(http://perso.ens-lyon.fr/damien.stehle/fplll/$pkgname-$pkgver.tar.gz)
md5sums=('5f418674e20908a9e105b999fa4ab3a6')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

