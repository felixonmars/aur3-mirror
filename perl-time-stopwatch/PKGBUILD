# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-time-stopwatch'
pkgver='1.00'
pkgrel='1'
pkgdesc="Tied variables that count seconds"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Time-Stopwatch'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILTZU/Time-Stopwatch-1.00.tar.gz')
md5sums=('9ae1b95ea417ba1a96f10ea2ac1b3818')
_distdir="${srcdir}/Time-Stopwatch-1.00"

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
