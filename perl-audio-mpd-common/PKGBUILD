# Maintainer: Jason St. John <jstjohn .. purdue . edu>

_perlmod=Audio-MPD-Common
_modnamespace=Audio
pkgname=perl-audio-mpd-common
pkgver=2.002
pkgrel=1
pkgdesc="Audio::MPD::Common - common helper classes for MPD"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
depends=('perl-moose>=0.92' 'perl-moosex-has-sugar' 'perl-moosex-types' 'perl-readonly' 'perl-string-formatter')
makedepends=('perl-module-build>=0.3601')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('8a8cf411e1a14c859703632bb0178d64efefe7a036d8484057af7a70da38e748ac02d8c1496a98ae79162c5a87f02b6faf0298b4c4827ea509e5c9ebcbbf3d90')

build() {
	cd "${_perlmod}-${pkgver}"

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
