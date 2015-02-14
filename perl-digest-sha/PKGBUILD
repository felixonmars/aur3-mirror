# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>

_perlmod=Digest-SHA
_modnamespace=Digest
pkgname=perl-digest-sha
pkgver=5.95
pkgrel=1
pkgdesc="Digest::SHA - Perl extension for SHA-1/224/256/384/512"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('2200006c9bede1f8c2332da7cafc5ba59e874deaef414c6050733029de7145c2387cacfb4020d0b7d0addd1ab3455b053c918524514773e20ff64d6dc8cbdb9f')

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
