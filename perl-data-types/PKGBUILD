# Maintainer: kevku <kevku@msn.com>
pkgname=perl-data-types
pkgver=0.09
pkgrel=1
pkgdesc="Data::Types - Validate and convert data types."
arch=('any')
url="http://search.cpan.org/~dwheeler/Data-Types"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/Data-Types-$pkgver.tar.gz")
md5sums=('13fd546f9306eff1fa3e8d4e79a5d9f3')

build() {
  cd "$srcdir/Data-Types-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Data-Types-$pkgver"
  make install DESTDIR="$pkgdir/"
}

