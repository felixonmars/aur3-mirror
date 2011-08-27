# Maintainer: David Pernot <dpernot@gmail.com>
# This package is used by xcas which requires 2.3 release

pkgname=pari23
pkgver=2.3.4
pkgrel=1
pkgdesc='Computer algebra system designed for fast computations in number theory'
arch=('i686' 'x86_64')
url='http://pari.math.u-bordeaux.fr/'
license=('GPL')
depends=('gmp' 'readline')
makedepends=('perl' 'texlive-core')
conflicts=('pari')
optdepends=('perl: gphelp, tex2mail'
            'libx11: high precision plots')
source=("${url}pub/pari/unix/OLD/pari-$pkgver.tar.gz")
sha1sums=('0c97456c5fc7e9fe774ceb44aaf77e9ba9574ae6')

build() {
	cd "$srcdir/pari-$pkgver"
	./Configure --prefix=/usr --with-gmp --with-readline
	make all
}

check() {
	cd "$srcdir/pari-$pkgver"
	make bench
}

package() {
	cd "$srcdir/pari-$pkgver"
	make DESTDIR="$pkgdir" install

	# symlink pointing to a symlink that is going to be moved by zipman
	rm "$pkgdir"/usr/share/man/man1/pari.1
	ln -s gp.1.gz "$pkgdir"/usr/share/man/man1/pari.1.gz
}
