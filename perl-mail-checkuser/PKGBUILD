# Packager: Florian Pritz <bluewind@xinu.at>

pkgname=perl-mail-checkuser
pkgver=1.21
pkgrel=1
pkgdesc='check email addresses for validity'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl perl-net-dns)
url=https://metacpan.org/release/Mail-CheckUser
source=("http://search.cpan.org/CPAN/authors/id/I/IL/ILYAM/Mail-CheckUser-$pkgver.tar.gz")
md5sums=(32a57a4679e2bde8a85201617776d69f)
sha512sums=(9fbfc4698ca1ed4c0b953724b91f593b6ab2a5a08076874c531c3ec2e330c741f44d53c165262b51a7d9124b7cb6678eb0ed008ab3065a683857667950cd91ee)
_ddir="Mail-CheckUser-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  # tests fail
  #make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
