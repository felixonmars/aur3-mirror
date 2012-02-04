# Maintainer: Moritz Heidkamp <moritz@twoticketsplease.de>

pkgname=perl-html-tableparser
pkgver=0.38
pkgrel=1
pkgdesc="Perl/CPAN Module HTML::TableParser : Extract data from an HTML table"
arch=("i686" "x86_64")
url="http://search.cpan.org/~djerius/HTML-TableParser/"
license=("GPL")
source=("http://search.cpan.org/CPAN/authors/id/D/DJ/DJERIUS/HTML-TableParser-${pkgver}.tar.gz")
md5sums=('b6115184005c17695fde7f003326d143')
depends=("perl-html-parser")

build() {
  cd $startdir/src/HTML-TableParser-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
  make install DESTDIR=$startdir/pkg || return 1
  find $startdir/pkg -name '.packlist' -delete
  find $startdir/pkg -name '*.pod' -delete
}