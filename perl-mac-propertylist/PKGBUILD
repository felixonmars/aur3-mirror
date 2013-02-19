# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-mac-propertylist'
pkgver='1.38'
pkgrel='1'
pkgdesc="work with MacOS X plist files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-entities')
makedepends=()
url='http://search.cpan.org/dist/Mac-PropertyList'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Mac-PropertyList-1.38.tar.gz')
md5sums=('20eb6db3002823c8b7c8002cff7499d0')
sha512sums=('be4ddfb27c01f3f40cd1a17e47ecf1a2d0967b150403980129dd1ed61d610d4b5a0df14c401fb1cdecf1823816aafc9d84ce6cfef9a9bb4e189a98f043398f62')
_distdir="${srcdir}/Mac-PropertyList-1.38"

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
