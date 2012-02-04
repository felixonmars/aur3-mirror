# Contributor: 3ED <krzysztof1987 at gmail dot com>
#
_lastauthor=D/DO/DOY
_pkgname=Package-Stash-XS

pkgname=perl-package-stash-xs
pkgver=0.25
pkgrel=2
pkgdesc="faster and more correct implementation of the Package::Stash API"
arch=(i686 x86_64)
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-test-fatal' 'perl-extutils-makemaker')
url='http://search.cpan.org/dist/Package-Stash-XS/'
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('739c5810d69a28346b35886e7335889538d1449f1365616420d8e9131aac85c4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export PERL_MM_USE_DEFAULT=1
  export PERL_AUTOINSTALL='--skipdeps'
  perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
