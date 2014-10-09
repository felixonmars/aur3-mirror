# Maintainer: Gabriel Ebner <gebner@gebner.org>
pkgname=verit
pkgver=201410
pkgrel=1
pkgdesc="An open, trustable and efficient SMT-solver"
arch=('x86_64')
url="http://www.verit-solver.org/"
license=('BSD')
depends=(gmp)
makedepends=(flex bison)
options=(!makeflags)
source=(http://www.verit-solver.org/distrib/veriT-$pkgver.tar.gz)
md5sums=('a549e4c55479c22c46fa75e2d5b1eba2')

build() {
	cd "$srcdir/veriT-$pkgver"
        # EXTERN= disables building the internal copy of gmp
	make EXTERN=
}

package() {
	cd "$srcdir/veriT-$pkgver"
        install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/verit/LICENSE"
        install -D -m0755 veriT "$pkgdir/usr/bin/veriT"
}
