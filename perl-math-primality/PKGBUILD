# Maintainer: Janno T. <jaxnnxot@gmail.com>
_author=BUBAFLUB
_perlmod=Math-Primality
pkgname=perl-math-primality
pkgver=0.04
pkgrel=1
pkgdesc="Advanced Primality Algorithms using GMP"
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0', 'gmp')
options=(!emptydirs)
install=
source=(http://cpan.perl.org/modules/by-authors/id/B/BU/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('357d19c10bbca2f81d5a2d42f6bb3f54')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
}

# vim:set ts=2 sw=2 et:
