# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=perl-regexp-common-net-cidr
pkgver=0.02
pkgrel=1
pkgdesc="Provide patterns for CIDR blocks"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~ruz/Regexp-Common-net-CIDR-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-regexp-common')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RU/RUZ/Regexp-Common-net-CIDR-$pkgver.tar.gz")
md5sums=('e109d32c7ed46956477cf94e54d1442a')

build() {
	cd "$srcdir/Regexp-Common-net-CIDR-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Regexp-Common-net-CIDR-$pkgver"
	make install DESTDIR="$pkgdir"
}
