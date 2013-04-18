# Maintainer: Max Meyer |dev|ÄT|fedux.org|
_author=MLFISHER
_perlmod=pmtools
pkgname=perl-$_perlmod
pkgver=1.30
pkgrel=1
pkgdesc="a suite of small programs to help manage perl modules."
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/ML/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('8662103905aba2debfe36e378fb3130e4b0367eb4d271ac851317dc2b8deea90')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
