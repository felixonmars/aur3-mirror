# Maintainer: Jason St. John <jstjohn .. purdue . edu>

_perlmod=Statistics-R
_modnamespace=Statistics
pkgname=perl-statistics-r
pkgver=0.33
pkgrel=1
pkgdesc="Statistics::R - Perl interface to the R statistical program"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
depends=('perl-ipc-run' 'perl-regexp-common' 'r')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('6ec57a53126ae20da9640b79c3899a6f962d3941906975377385ff380256aa7232d1fc2915434abc1ef6aaae57ed8477698ec135a910995d0244925a1b9a6bcc')

build() {
	cd "${_perlmod}-${pkgver}"

	# Install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd "${_perlmod}-${pkgver}"
	make test
}

package() {
	cd "${_perlmod}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
