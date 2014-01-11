# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_perlmod=Pod-Simple
_modnamespace=Pod
pkgname=perl-pod-simple
pkgver=3.28
pkgrel=3
pkgdesc="Pod::Simple - the framework for parsing Pod"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('3b10d389491662242ecabbb53a4c979cdc70a469fe7f4bc184f964590d0f39ec955d86cc979dd17e9aa3024cf3f7d59a132daf88df04baec0546c13287848f09')

build() {
	cd "${srcdir}/${_perlmod}-${pkgver}"

	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${srcdir}/${_perlmod}-${pkgver}"
	make test
}

package() {
	cd "${srcdir}/${_perlmod}-${pkgver}"
	make install DESTDIR="${pkgdir}/"
}
