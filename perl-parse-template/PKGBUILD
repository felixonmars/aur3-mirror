# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=perl-parse-template
_pkgname=ParseTemplate
pkgver=3.03
pkgrel=1
pkgdesc="Parse::Template - processor for templates containing Perl expressions"
url="http://search.cpan.org/perldoc?Parse::Template"
license=('PerlArtistic')
arch=('any')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a03956abe5093aa08d97f1e81d9e44fd')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	perl Makefile.PL installdirs=vendor destdir="$pkgdir/" || return 1;
	make || return 1;
	make install || return 1;
}

