# Maintainer: George Hilliard <gh403 at msstate dot edu>
_author=Apocalypse
_perlmod=poe-component-simpledbi
pkgname=perl-$_perlmod
pkgver=1.30
pkgrel=1
pkgdesc="Asynchronous non-blocking DBI calls in POE made simple"
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('PerlArtistic')
groups=()
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/A/AP/APOCAL/POE-Component-SimpleDBI-$pkgver.tar.gz)
md5sums=('cf305390634ae3f70ad331cdbb8e49d7')

build() {
  cd "$srcdir/POE-Component-SimpleDBI-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/POE-Component-SimpleDBI-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
