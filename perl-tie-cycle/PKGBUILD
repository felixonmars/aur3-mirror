# Maintainer: Christoph Vigano  <mail@cvigano.de>
_author=BDFOY
_perlmod=Tie-Cycle
pkgname=perl-tie-cycle
pkgver=1.21
pkgrel=1
pkgdesc="Cycle through a list of values via a scalar"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('Artistic 2.0')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Tie-Cycle-$pkgver.tar.gz)
sha256sums=('1e94c98d7e6cbb1263d3defc9d0e9b6e6fc97dc8bb8acc29df82e8005a6d3564')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL &&
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
