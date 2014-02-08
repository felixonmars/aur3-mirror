# Contributor: bocke <bocke@mycity.rs>
# Contributor: MIZUNO J.Y. <http://p.mjy.name/>
# maintainer: perlawk

pkgname=cproto
pkgver="4.6"
pkgrel=2
pkgdesc="Generates function prototypes from C source"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cproto/"
license=('custom:public domain')
source=("http://ncu.dl.sourceforge.net/project/cproto/cproto/${pkgver}/cproto-${pkgver}.tar.gz")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's!/lib/cpp!/usr/bin/cpp!g' system.h
	sed -i 's!/lib/cpp!/usr/bin/cpp!g' configure
	sed -i 's!/lib/cpp!/usr/bin/cpp!g' cproto.1
	sed -i 's/mktemp/mkstemp/g' lex.l
	sed -i 's/mktemp/mkstemp/g' cproto.c
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	cp cproto "$pkgdir/usr/bin"
	cp cproto.1 "$pkgdir/usr/share/man/man1"
}
		
md5sums=('5968d18e9508b2892471e6ef16e140e3')
