# Contributor: Remy Oudompheng <remy@archlinux.org>
# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>

pkgname=mpfi
pkgver=1.5.1
pkgrel=1

pkgdesc="A multiple precision interval arithmetic library based on MPFR"
arch=('any')
url="http://perso.ens-lyon.fr/nathalie.revol/software.html"
license=('LGPL')

depends=('gmp>=4.3.2' 'mpfr>=2.4.2')

source=("https://gforge.inria.fr/frs/download.php/30129/mpfi-1.5.1.tar.bz2")
md5sums=('ce788b73b62eca1945db2ef453ee1364')

install=mpfi.install

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-shared
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

