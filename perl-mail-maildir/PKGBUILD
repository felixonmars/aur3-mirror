# Contributor: coolkehon <coolkehon@gmail.com>
pkgname=perl-mail-maildir
pkgver='1.00'
pkgrel=1
pkgdesc="Mail::Maildir -- Maildir/Maildir++ filesystem implementation"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~zeroalti/Mail-Maildir-1.0.0/lib/Mail/Maildir.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEROALTI/Mail-Maildir-100/Mail-Maildir-1.0.0.tar.bz2)
md5sums=('33204eea151f9e221b994e0e8364ba39')

build() {
  cd "$srcdir/Maildir-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  ## for packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
  # perl Build install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:

