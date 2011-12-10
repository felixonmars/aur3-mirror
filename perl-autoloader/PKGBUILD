# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-autoloader'
pkgver='5.72'
pkgrel='1'
pkgdesc="load subroutines only on demand"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/AutoLoader'
source=('http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/AutoLoader-5.72.tar.gz')
md5sums=('b57dd75128b9cb8a2de029894fa6193a')
sha512sums=('1c979092d316858519402f558276e2997ae7bd33a9264f2ec97a4779b6b34f79e240b40b8eb66a8f10eec83c8eff46f932f89297f7748501cbf8ed633c60543c')
_distdir="${srcdir}/AutoLoader-5.72"

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
