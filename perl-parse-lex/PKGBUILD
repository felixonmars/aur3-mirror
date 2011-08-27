# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=perl-parse-lex
_pkgname=ParseLex
pkgver=2.19
pkgrel=1
pkgdesc="Parse::Lex - generator of lexical analyzers (moving pointer inside text)"
url="http://search.cpan.org/perldoc?Parse::Lex"
license=('PerlArtistic')
arch=('any')
depends=('perl>=5.10.0' 'perl-parse-template')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b90378ddd3bd112f3afb5d4bbced2af6')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	perl Makefile.PL installdirs=vendor destdir="$pkgdir/" || return 1;
	make || return 1;
	make install || return 1;
}

