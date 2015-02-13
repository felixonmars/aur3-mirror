# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>

_perlmod=Sys-Info-Base
_modnamespace=Sys
pkgname=perl-sys-info-base
pkgver=0.7804
pkgrel=1
pkgdesc="Sys::Info::Base - Base class for Sys::Info"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('8fbf2e2ae1ca8d1cc17149dc26a61adce02ab4bd382e5d2c08a5ff90461e1acc35f66471f2084820aec94205c3462cc063b38c763235a95a48c1047e41991764')

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
