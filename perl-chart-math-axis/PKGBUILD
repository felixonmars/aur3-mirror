# Maintainer: shacristo <shacristo at gmail dot com>

_author=ADAMK
_perlmod=Chart-Math-Axis

pkgname=perl-chart-math-axis
pkgver=1.06
pkgrel=1
pkgdesc="Implements an algorithm to find good values for chart axis"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('PerlArtistic')
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('2b0821981a44f6d6d880d8e62c186449')

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
