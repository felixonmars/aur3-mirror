# CPAN Name  : App-cpanminus
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-app-cpanminus'
pkgver='1.5001'
pkgrel='1'
pkgdesc="Get, unpack, build and install modules from CPAN."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
optdepends=('perl-libwww: A more robust web accessing module.')
url='http://search.cpan.org/dist/App-cpanminus'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/App-cpanminus-1.5001.tar.gz')
md5sums=('fa9c7f7deac052f082bc0ed2474d589f')
_distdir="${srcdir}/App-cpanminus-1.5001"

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
