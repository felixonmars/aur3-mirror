# Maintainer: Yuichi TADOKORO <tokoro10g@tokor.org>
pkgname=opendetex
pkgver=2.8.1
pkgrel=1
pkgdesc="A program to remove TeX constructs from a text file"
arch=('i686' 'x86_64')
url="https://code.google.com/p/opendetex/"
license=('custom:NCSA')
groups=()
depends=(flex)
checkdepends=(perl)
options=()
install=
changelog=
source=(https://opendetex.googlecode.com/files/$pkgname-$pkgver.tar.bz2)

md5sums=('2576b00dfbc076e4e6530ce9227da747')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i '/^LEXLIB.*ll/d' Makefile
	sed -i 's/#LEXLIB/LEXLIB/' Makefile
}

build() {
	cd "$srcdir/$pkgname"
	make
}

check() {
	cd "$srcdir/$pkgname"
	make testing
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 detex "$pkgdir/usr/bin/opendetex"
	install -D COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
