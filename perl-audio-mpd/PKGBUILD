# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Justin Davis <jrcd83@gmail.com>

_perlmod=Audio-MPD
_modnamespace=Audio
pkgname=perl-audio-mpd
pkgver=2.000
pkgrel=1
pkgdesc="Audio::MPD - class to talk to MPD (Music Player Daemon) servers"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
depends=('perl-audio-mpd-common' 'perl-getopt-euclid' 'perl-io-socket-ip' 'perl-moose' 'perl-moosex-has-sugar' 'perl-moosex-semiaffordanceaccessor' 'perl-proc-daemon')
makedepends=('perl-module-build>=0.3601' 'perl-test-corpus-audio-mpd>=1.113282')
checkdepends=('perl-list-allutils')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('11cbcf8c7fe44f9c62f7ae53eca65543105e75e685b771faec6998f10d6b64e9d715880e125311f9b1122dca1a508be0cabe9a942d94252303e26a6fdae34e0c')

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
