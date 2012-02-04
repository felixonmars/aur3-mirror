# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-test-fatal'
pkgver='0.008'
pkgrel='1'
pkgdesc="incredibly simple helpers for testing code with exceptions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-try-tiny>=0.07')
makedepends=()
url='http://search.cpan.org/dist/Test-Fatal'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Test-Fatal-0.008.tar.gz')
md5sums=('201c94efbbcbd38b32e3cdc6752a6c07')
sha512sums=('5d85a70307076a7535d315992deef2364bcb54328c0fd3192341ce4d3a84b21432112d1241413997936fcd40ee9b346344e65a928047bcad2b02ada53e7bb7fe')
_distdir="${srcdir}/Test-Fatal-0.008"

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
