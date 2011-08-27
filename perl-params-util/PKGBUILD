# Contributor: AUR Perl <aurperl@juster.info>
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-params-util'
pkgver='1.04'
pkgrel='1'
pkgdesc="Simple, compact and correct param-checking functions"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Params-Util'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Params-Util-1.04.tar.gz')
md5sums=('84bfb0a16cff67f2077ece0e24408b0f')
_distdir="${srcdir}/Params-Util-1.04"

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
