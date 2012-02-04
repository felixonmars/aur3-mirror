# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-html-wikiconverter-dokuwiki'
pkgver='0.53'
pkgrel='1'
pkgdesc="Convert HTML to DokuWiki markup"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-wikiconverter>=0.53')
makedepends=('perl-html-wikiconverter>=0.53')
url='http://search.cpan.org/dist/HTML-WikiConverter-DokuWiki'
source=('http://search.cpan.org/CPAN/authors/id/D/DI/DIBERRI/HTML-WikiConverter-DokuWiki-0.53.tar.gz')
md5sums=('74f5cd1382962ca5d24a39dd6b15059d')
sha512sums=('958ee11c36cdb8a232fa06245b6d311eaa45c895cf3e9e9b9352cf1ba8264a719b67b204d636eea9211d87eb412d70fe7a367fe412add85b614ca594c7db21b4')
_distdir="${srcdir}/HTML-WikiConverter-DokuWiki-0.53"

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
