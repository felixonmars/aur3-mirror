# Contributor: 3ED <krzysztof1987 at gmail dot com>
#

pkgname=perl-poe-component-client-mpd
_lastauthor=J/JQ/JQUELIN
_pkgname=POE-Component-Client-MPD
pkgver=2.000
pkgrel=1
pkgdesc="full-blown poe-aware mpd client library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moosex-has-sugar' 'perl-moosex-types' 'perl-moosex-semiaffordanceaccessor' 'perl-moosex-poe' 'perl-list-allutils' 'perl-audio-mpd-common' 'perl-poe' 'perl-test-corpus-audio-mpd>=1.120990')
makedepends=('perl-module-build')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('6de12c3e77936d1043c327298e95f6367adf9cac1556b509519fc62f75cebdd2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  perl Build.PL
  perl Build
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Build install
}
