# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=doxygenfilter
pkgver=1.10
pkgrel=1
pkgdesc="Input filter for Doxygen enabling support for Perl code documentation."
url="http://www.bigsister.ch/doxygenfilter/doxygenfilter.html"
arch=('i686' 'x86_64')
license=('PerlArtistic')
depends=('perl')
source=("http://prdownloads.sourceforge.net/bigsister/${pkgname}-${pkgver}.tar.gz")
md5sums=('8ac8437403cb8bdd605b32125150487e')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
	make || return 1
	make install DESTDIR="$pkgdir" || return 1
	find "$pkgdir" -name '.packlist' -delete
	find "$pkgdir" -name '*.pod' -delete
}

