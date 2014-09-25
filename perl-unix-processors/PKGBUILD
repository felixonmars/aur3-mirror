# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>

_perlmod=Unix-Processors
_modnamespace=Unix
pkgname=perl-unix-processors
pkgver=2.043
pkgrel=1
pkgdesc="Unix::Processors - Interface to per-processor information"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_perlmod}"
license=('LGPL3' 'Artistic2.0')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('acfb021e0974baef9fb9dece9cdb64a36ec3cc339191c109efde860b56fa05e9385c49b66de1a16e7c88300ecdd60ee89db5d3e90dfc4d8eb0ba10d618fd6ce9')

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
