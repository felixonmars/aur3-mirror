# Maintainer: George Hilliard <gh403 at msstate dot edu>
_author=gregfast
_perlmod=lingua-en-syllable
pkgname=perl-$_perlmod
pkgver=0.251
pkgrel=1
pkgdesc="Routine for estimating syllable count in words."
arch=(any)
url="http://search.cpan.org/~$_author/Lingua-EN-Syllable-$pkgver/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/G/GR/GREGFAST/Lingua-EN-Syllable-$pkgver.tar.gz)
md5sums=('f44a056e92c1d9df89e190591879d84f')

build() {
  cd "$srcdir/Lingua-EN-Syllable-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Lingua-EN-Syllable-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
