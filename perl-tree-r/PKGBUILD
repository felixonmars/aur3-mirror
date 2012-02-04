# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.04
pkgname='perl-tree-r'
pkgver='0.06'
pkgrel='1'
pkgdesc="Perl extension for the Rtree data structure and algorithms"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Tree-R'
source=('http://search.cpan.org/CPAN/authors/id/A/AJ/AJOLMA/Tree-R-0.06.tar.gz')
md5sums=('629ae017bb7fefb925b1475f6275f338')

build() {
  DIST_DIR="${srcdir}/Tree-R-0.06"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    perl Makefile.PL &&
    make &&
    make test &&
    make install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
