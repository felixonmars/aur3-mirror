# Submitter: perlawk

pkgname=hope
pkgver=1.0
pkgrel=2
pkgdesc="Hope is a small functional programming language, with polymorphic typing, algebraic types, pattern matching and higher-order functions. The version here is a fully lazy interpreter."
arch=('i686' 'x86_64')
url="http://www.soi.city.ac.uk/~ross/Hope/"
license=('GPL')
depends=('')
options=(!strip)
install=hope.install

source=(http://www.soi.city.ac.uk/~ross/Hope/hope.tar.gz)

build() {
	cd "$srcdir"/hope
	./configure --prefix=/usr 
	sed -i 's/getline/lgetline/g;' src/source.h
	sed -i 's/getline/lgetline/g;' src/source.c
	sed -i 's/getline/lgetline/g;' src/yylex.c
	sed -i '/#define size_t/d;' src/config.h
	make
}

package() {
	cd "$srcdir"/hope/
 /usr/bin/install -c -d "$pkgdir"/usr/bin
	/usr/bin/install -c -d "$pkgdir"/usr/share/hope/lib
	/usr/bin/install -c -d "$pkgdir"/usr/share/man/man1

	cd src
	/usr/bin/install -c -s hope "$pkgdir"/usr/bin/
	/usr/bin/install -c -m 644 hope.1 "$pkgdir"/usr/share/man/man1

	cd ../lib
	for f in *.hop; do /usr/bin/install -c -m 644 $f "$pkgdir"/usr/share/hope/lib; done
	/usr/bin/install -c -d "$pkgdir"/usr/share/hope/lib.new
	sed -f list.sed Standard.hop >Standard-new.hop
	/usr/bin/install -c -m 644 Standard-new.hop "$pkgdir"/usr/share/hope/lib.new/Standard.hop
 rm -f Standard-new.hop
}

md5sums=('0f97cbc8307095bc235b98a3e210dcc9')
