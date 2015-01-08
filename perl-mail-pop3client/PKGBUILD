# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=perl-mail-pop3client
_realname=Mail-POP3Client
pkgver=2.19
pkgrel=1
pkgdesc="Perl/CPAN Module Mail::POP3Client : Perl 5 module to talk to a POP3 (RFC1939) server"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Mail-POP3Client"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/S/SD/SDOWD/${_realname}-${pkgver}.tar.gz)
md5sums=('8ee509c9118fdd65a6d777b3f5f1c835')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_realname}-$pkgver"
  make install DESTDIR="$pkgdir"
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
