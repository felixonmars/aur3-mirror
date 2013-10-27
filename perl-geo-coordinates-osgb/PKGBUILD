# Maintainer: Bernhard Redl <bernhard.redl@vishap.>
_author=T/TO/TOBY
_perlmod=Geo-Coordinates-OSGB
pkgname=perl-geo-coordinates-osgb 
#$_perlmod
pkgver=2.05
pkgrel=1
pkgdesc='This is the Geo::Coordinates::OSGB.pm module!'
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=(http://cpan.perl.org/modules/by-authors/id/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('44e04a1ff6540b16f051d22337b19c5f')

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

