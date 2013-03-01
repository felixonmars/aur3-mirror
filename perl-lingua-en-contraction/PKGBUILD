# Maintainer: George Hilliard <gh403 at msstate dot edu>
_author="Russell Graham"
_perlmod=lingua-en-contraction
pkgname=perl-$_perlmod
pkgver=0.104
pkgrel=1
pkgdesc="Contractions for English sentences"
arch=(any)
url="http://search.cpan.org/~rwg/Lingua-EN-Contraction-$pkgver"
license=('PerlArtistic' 'GPL')
groups=()
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/R/RW/RWG/Lingua-EN-Contraction-$pkgver.tar.gz)
md5sums=('1a69e23dbf7066400f11785373befedd')

build() {
  cd "$srcdir/Lingua-EN-Contraction-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build 
}

package() {
  cd "$srcdir/Lingua-EN-Contraction-$pkgver"
  perl Build install
}

# vim:set ts=2 sw=2 et:
