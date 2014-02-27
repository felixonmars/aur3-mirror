# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=perl-email-date
_realname=Email-Date
pkgver=1.104
pkgrel=1
pkgdesc="Perl/CPAN Module Email::Date : Find and Format Date Headers"
arch=(i686 x86_64)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Email-Date/"
depends=('perl-email-abstract' 'perl-timedate')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/${_realname}-${pkgver}.tar.gz)
md5sums=('4df8d2025e24ffc37217b678ec7e4cb3')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  # Install module into the vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  
  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete
}
# vim: ts=2 sw=2 et ft=sh
