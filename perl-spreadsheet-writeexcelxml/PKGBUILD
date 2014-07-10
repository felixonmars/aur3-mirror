# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-spreadsheet-writeexcelxml'
pkgver='0.14'
pkgrel='1'
pkgdesc="Create an Excel file in XML format."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Spreadsheet-WriteExcelXML'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Spreadsheet-WriteExcelXML-0.14.tar.gz')
md5sums=('9a9ab86138ab8fbb0d733c9254133421')
sha512sums=('d5690074d66e5a7689e06edc4930c8c7b4efa4c26c5addee00c09430548503653be324a40fcab4fd88a3538a895764e6868b0e4751c53df1b4e7b002846965fb')
_distdir="Spreadsheet-WriteExcelXML-0.14"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
