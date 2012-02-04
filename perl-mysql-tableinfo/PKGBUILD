pkgname=perl-mysql-tableinfo
pkgver=1.01
pkgrel=1
pkgdesc="MySQL::TableInfo - Perl extension for getting access into mysql's column information."
arch=('any')
url="http://search.cpan.org/~sherzodr/MySQL-TableInfo-1.01/TableInfo.pm"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHERZODR/MySQL-TableInfo-$pkgver.tar.gz)
md5sums=('8713c947acaa10c5899d96c5f58e705b')

build() {
  cd  "$srcdir/MySQL-TableInfo-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}