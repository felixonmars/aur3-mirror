# Maintainer: Brian De Wolf <arch@bldewolf.com>
pkgname=perl-db_file-lock
pkgver=0.05
pkgrel=1
pkgdesc="Locking with flock wrapper for DB_File"
arch=(any)
url="http://search.cpan.org/dist/DB_File-Lock/"
license=('Unknown')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/D/DH/DHARRIS/DB_File-Lock-$pkgver.tar.gz)
md5sums=('8be62f30cd8b395b870b492c981d223b')

build() {
  cd "$srcdir/DB_File-Lock-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  
  ## for packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/DB_File-Lock-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## for packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:
