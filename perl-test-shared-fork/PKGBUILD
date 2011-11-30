# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-test-shared-fork
pkgver=0.19
pkgrel=2
pkgdesc="fork test"
arch=(any)
url="http://search.cpan.org/dist/Test-SharedFork/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
install=
source=(http://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/Test-SharedFork-$pkgver.tar.gz)
md5sums=('cfc26372a45bb081abf24e3dfcf549c6')

build() {
  cd "$srcdir/Test-SharedFork-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
