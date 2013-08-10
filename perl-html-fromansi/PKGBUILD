# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
_author=NUFFIN
_perlmod=HTML-FromANSI
pkgname=perl-html-fromansi
pkgver=2.03
pkgrel=1
pkgdesc="converts ANSI text sequences to corresponding HTML codes"
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-term-vt102-boundless')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/N/NU/$_author/$_perlmod-$pkgver.tar.gz)

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

  ## For packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:
md5sums=('5a0ab05d512bedc75e3bbd015c929ca3')
