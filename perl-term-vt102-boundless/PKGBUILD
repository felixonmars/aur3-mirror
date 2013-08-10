# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
_author=NUFFIN
_perlmod=Term-VT102-Boundless
pkgname=perl-term-vt102-boundless
pkgver=0.03
pkgrel=1
pkgdesc="grow the virtual screen to accomodate arbitrary width and height of text."
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
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
md5sums=('76b1197bec0c57a7246f20720577d08b')
