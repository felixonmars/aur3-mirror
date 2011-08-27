# Contributor: AUR Perl <aurperl@juster.info>
# Generator  : CPANPLUS::Dist::Arch 1.17

pkgname='perl-pathtools'
pkgver='3.33'
pkgrel='1'
pkgdesc="Current working directory functions"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/PathTools'
source=('http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/PathTools-3.33.tar.gz')
md5sums=('92f0df032c399fadef2e2e647ebc3111')
_distdir="${srcdir}/PathTools-3.33"

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
