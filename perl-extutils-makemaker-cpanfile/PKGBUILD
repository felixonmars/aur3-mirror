# Maintainer: Bernhard Walle <bernhard@bwalle.de>

_author=ISHIGAKI
_perlmod=ExtUtils-MakeMaker-CPANfile
_perlmodlc=$(echo "$_perlmod" | tr [A-Z] [a-z])
pkgname=perl-$_perlmodlc
pkgver=0.06
pkgrel=1
pkgdesc="cpanfile support for EUMM"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.20.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://cpan.perl.org/modules/by-authors/id/I/IS/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('8e1a42d67b57ed15e08e25872dd84cac')
sha512sums=('79bf10fddfb661c9d0533f30e73ac3c19f3f25fcfc9ee6e4861aee4e8429b889430b3e29fc38edcbcd8e98f7310a8ce6f44059de17f499b44425e2d734571c1d')

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
