pkgname=perl-text-csv-slurp
pkgver=1.01
pkgrel=1
pkgdesc="Turn a chunk of CSV into an array of hashes or an array of hashes into CSV"
arch=('any')
url="http://search.cpan.org/dist/Text-CSV-Slurp/"
license=('PerlArtistic')
depends=('perl-io' 'perl-text-csv')
makedepends=('perl-extutils-makemaker')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/B/BA/BABF/Text-CSV-Slurp-$pkgver.tar.gz")
md5sums=('2f998490161a179b292f4571b1fbf9f6')

build() {
  cd "$srcdir/Text-CSV-Slurp-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Text-CSV-Slurp-$pkgver"
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
