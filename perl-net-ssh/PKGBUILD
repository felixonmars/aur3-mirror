# Contributor: Marcin Karpezo <sirmacik at archrepo dot net>
pkgname=perl-net-ssh
pkgver=0.09
pkgrel=1
pkgdesc="Perl extension for secure shell"
arch=(any)
url="http://search.cpan.org/~ivan/Net-SSH-0.09/SSH.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/Net-SSH-$pkgver.tar.gz)
md5sums=('96837a66d0329e49cf5febd8b1ff4315')

build() {
  cd "$srcdir/Net-SSH-$pkgver"

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:

