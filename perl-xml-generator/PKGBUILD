# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-xml-generator'
pkgver='1.04'
pkgrel='1'
pkgdesc="Generates XML documents"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/XML-Generator'
source=('http://search.cpan.org/CPAN/authors/id/B/BH/BHOLZMAN/XML-Generator-1.04.tar.gz')
md5sums=('1ea1e239bdf3fd6f762c484753776626')
sha512sums=('ce151a2d575c9ec4cd42819a5d573bfc4985e0daa3945c310d61bb0a6376e4b8a0dcef5ce89e444795d99c9751719d45981675d1418ba6d729d152187688d552')
_distdir="${srcdir}/XML-Generator-1.04"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
