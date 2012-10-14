# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl-regexp-grammars
pkgver=1.021
pkgrel=1
pkgdesc="Perl/CPAN Module Regexp::Grammars - Add grammatical parsing features to Perl regexes"
arch=('any')
url="http://search.cpan.org/~dconway/Regexp-Grammars/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/Regexp-Grammars-${pkgver}.tar.gz")
md5sums=('6d09cd8c12f638e8e8e5e3dd586c3b8c')

build() {
  cd "Regexp-Grammars-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "Regexp-Grammars-${pkgver}"
  make test
}

package() {
  cd "Regexp-Grammars-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 ft=sh et:
