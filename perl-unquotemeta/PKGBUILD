# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>
PACKAGER="kpj <kpjkpjkpjkpjkpjkpj@gmail.com>"

pkgname='perl-unquotemeta'
pkgver='0.1'
pkgrel='1'
pkgdesc="Undo what quotemeta() does, nothing more nothing less."
arch=('any')
license=('PerlArtistic' 'GPL')
url='http://search.cpan.org/~dmuey/String-Unquotemeta/'
source=("http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/String-Unquotemeta-${pkgver}.tar.gz")
md5sums=('025f025e74e19e8ca34df27c965f271a')

_distdir="${srcdir}/String-Unquotemeta-${pkgver}"


build() {
	(
		export PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
		PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
		MODULEBUILDRC=/dev/null

		cd "${srcdir}/String-Unquotemeta-${pkgver}";
		/usr/bin/perl Makefile.PL;
		make
	)
}

package() {
	cd "${srcdir}/String-Unquotemeta-${pkgver}";
	make install
}
