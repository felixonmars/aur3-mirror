# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-file-mork'
pkgver='0.3'
pkgrel='1'
pkgdesc="a module to read Mozilla URL history files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='http://search.cpan.org/dist/File-Mork'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SIMONW/File-Mork-0.3.tar.gz')
md5sums=('7b95af81a50ca232299f637d0d4775bf')
sha512sums=('373ead66345d7f9abb44bdcc949890e75530512b0df70f6f8cde4cd120d7bcba6b696424ceab190ce3d11e8d34c8809642536f9905003e6190996cba10f9a9f9')
_distdir="${srcdir}/File-Mork-0.3"

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
