# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Pete Morris <pete dot morris at gmail>

_perlmod=Text-VimColor
_modnamespace=Text
pkgname=perl-text-vimcolor
pkgver=0.26
pkgrel=1
pkgdesc="Text::VimColor - Syntax highlight text using Vim"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
depends=('perl-path-class>=0.04' 'perl-file-sharedir')
makedepends=('perl-file-sharedir-install>=0.06' 'perl-test-file-sharedir')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('33fc7c1da08e499199d7e7cecb53fae3d6dcd4f8207ed9cd250349e6f21691eac6335a19657cb69a22ec46f09b74171c4f6886438f5d5a85afe2f8680a09e82e')

build() {
	cd "${_perlmod}-${pkgver}"

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
