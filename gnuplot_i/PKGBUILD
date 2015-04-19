# maintainer: perlawk
pkgname=gnuplot_i
pkgver=2.11
pkgrel=2
pkgdesc="C interface for gnuplot"
arch=(i686 x86_64)
url="http://ndevilla.free.fr/gnuplot/"
license=('public domain')
groups=()
depends=(gnuplot)
makedepends=('doxygen')
provides=(gretl=$pkgver)
source=(Makefile 
http://ndevilla.free.fr/gnuplot/gnuplot_i-2.11.tar.gz)
noextract=()
md5sums=('a2ac0a9df55f5970798b99f409f73963'
         '286c1b66422e117720527e189a2bc368')

build() {
	cd "$srcdir/$pkgname"
	cp $startdir/Makefile .
	make || return 1
	cd doc
	make
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/{include,lib,share/doc/gnuplot_i}
	install -m644 libgnuploti.so $pkgdir/usr/lib/
	install -m644 src/gnuplot_i.h $pkgdir/usr/include/
	install -m644 html/* $pkgdir/usr/share/doc/gnuplot_i/
}
