# Maintainer: Bernhard Walle <bernhard@bwalle.de>

_author=MIYAGAWA
_perlmod=Module-CPANfile
_perlmodlc=$(echo "$_perlmod" | tr [A-Z] [a-z])
pkgname=perl-$_perlmodlc
pkgver=1.1000
pkgrel=1
pkgdesc="Parse cpanfile"
arch=('x86_64' 'i686')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
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
source=(http://cpan.perl.org/modules/by-authors/id/M/MI/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('28777403c3cbe8ac13db866b2135cb53')
sha512sums=('700b577dbc9cc42deb5a20fc1381425af45fa6b1b7db640ccd45a8f1e3d4d7faefe6f2567e738e8660b2d60c61135a6b0e771d449872141fc4c840ed2eb21a7f')

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
