# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>

_perlmod=Sys-Info
_modnamespace=Sys
pkgname=perl-sys-info
pkgver=0.78
pkgrel=6
pkgdesc="Sys::Info - Fetch information from the host system"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
depends=('perl-sys-info-base>=0.7803' 'perl-sys-info-driver-linux>=0.7903' 'perl-sys-info-driver-unknown>=0.78' 'perl-test-sys-info>=0.20')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('b472f02b4cce23fb711a9401fb766bdae4afdb6c1cbd329c9c7f1519ffe7617db0a969a87a1c0d43f20ee425fc83be79450a2a3ec51dcd61d91facd862dd9123')

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
