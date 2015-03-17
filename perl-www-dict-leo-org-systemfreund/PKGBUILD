# Maintainer: Oemer Yildiz <oemer@systemfreund.com>

pkgname=perl-www-dict-leo-org-systemfreund
pkgver=1.39
pkgrel=1
pkgdesc="Perl/CPAN Module WWW::Dict::Leo::Org : Interface module to dictionary dict.leo.org"
arch=("i686" "x86_64")
url="http://search.cpan.org/~tlinden/WWW-Dict-Leo-Org/"
license=("GPL" "PerlArtistic")
source=("http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/WWW-Dict-Leo-Org-${pkgver}.tar.gz")
md5sums=('02115f9acd6b406e5fb9255474cf7f42')
depends=('perl-html-tableparser-systemfreund')

build() {
  cd WWW-Dict-Leo-Org-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/WWW-Dict-Leo-Org-${pkgver}"
  make install DESTDIR=${pkgdir}
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}
