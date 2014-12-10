# Maintainer : Nigel Gourlay <ngourlay@gmail.com>
pkgname=perl-text-csv_xs
_cpanname=Text-CSV_XS
pkgver=1.12
pkgrel=1
pkgdesc="comma-separated values manipulation routines"
arch=('any')
url="http://search.cpan.org/~HMBRAND/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=()
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/H/HM/HMBRAND/${_cpanname}-${pkgver}.tgz) 
md5sums=('b91f2d806054b68c2a29d3da5821fe87')
build() {
  cd $srcdir/${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}
package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
