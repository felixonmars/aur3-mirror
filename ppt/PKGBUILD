# Contributed by: Jens Staal <staal1978@gmail.com>

pkgname=ppt
pkgver=0.14
pkgrel=1
pkgdesc="Perl Power Tools: Re-implemented *NIX utilities written in Perl"
arch=('i686' 'x86_64')
url="http://cpansearch.perl.org/src/CWEST/ppt-0.14/html/index.html"
license=('Custom:BSD')
source=('http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/ppt-0.14.tar.gz')
md5sums=('14f8c66c5b4fd51254bdd66a38ef6606')
depends=('perl')


build() {
cd $srcdir

	msg "setting up build directory"
	rm -rf $srcdir/build # starting fresh
	cp -ar $srcdir/$pkgname-$pkgver $srcdir/build
	cd $srcdir/build

	perl Makefile.PL PREFIX=$pkgdir/opt/ppt
	make
	make install
}
