# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-data-table'
pkgver='1.70'
pkgrel='1'
pkgdesc="Data type related to database tables, spreadsheets, CSV/TSV files, HTML table displays, etc."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Data-Table'
source=('http://search.cpan.org/CPAN/authors/id/E/EZ/EZDB/Data-Table-1.70.tar.gz')
md5sums=('15001e29d6e10af99149192451907ea1')
sha512sums=('a2d32fbc69e7cb522e2f7e4c72e12c36686ff05a59d73a7c947cd74b07b0fa8d97cd940e2305c8305767fca7a97ae47b3c1e0b79265458bc5e82802d1c9c078d')
_distdir="Data-Table-1.70"

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
