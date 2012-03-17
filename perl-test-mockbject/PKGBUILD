# Contributor: Christian Sturm <reezer@reezer.org>
pkgname=perl-test-mockbject
pkgver=1.20120301
pkgrel=1
pkgdesc="Perl extension for emulating troublesome interfaces"
arch=(any)
url="http://search.cpan.org/dist/Test-MockObject/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHROMATIC/Test-MockObject-$pkgver.tar.gz)
md5sums=('020ee433827e4e33ffe873eeb3e16048')

build() {
  cd "$srcdir/Test-MockObject-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
