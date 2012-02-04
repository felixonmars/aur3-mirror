# Contributor: Marcin Karpezo <sirmacik at archrepo dot net>
pkgname=perl-net-scp
pkgver=0.08
pkgrel=4
pkgdesc="Perl extension for secure copy protocol"
arch=(any)
url="http://search.cpan.org/~ivan/Net-SCP-0.08/SCP.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-net-ssh' 'perl-string-shellquote')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/Net-SCP-$pkgver.tar.gz)
md5sums=('09005478b3eb9f151163f58d03cf83c4')

build() {
  cd "$srcdir/Net-SCP-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:

