# Maintainer: Jason St. John <jstjohn .. purdue . edu>

_perlmod=Statistics-Descriptive
_modnamespace=Statistics
pkgname=perl-statistics-descriptive
pkgver=3.0608
pkgrel=1
pkgdesc="Statistics::Descriptive - Module of basic descriptive statistical functions."
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
depends=('perl-list-moreutils')
makedepends=('perl-test-pod-coverage')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('3e38f41538b1668f529864244ed8881f9d5fc8c6708e0112b7f92afb33186a972fecc13cdec65e83f589a97fa802fe172d683879650cc6e2ca79cf72d33e41b2')

build() {
	cd "${_perlmod}-${pkgver}"

	# Install module in vendor directories.
	perl Build.PL installdirs=vendor destdir="${pkgdir}"
	perl Build
}

check() {
	cd "${_perlmod}-${pkgver}"
	perl Build test
}

package() {
	cd "${_perlmod}-${pkgver}"
	perl Build install
}
