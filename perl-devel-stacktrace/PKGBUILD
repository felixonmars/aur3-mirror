# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-devel-stacktrace
pkgver=1.32
pkgrel=1
pkgdesc="Stacktrace object w/ info form caller()"
arch=('any')
url="http://search.cpan.org/dist/Devel-StackTrace/"
license=('PerlArtistic')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/D/DR/DROLSKY/Devel-StackTrace-$pkgver.tar.gz)
md5sums=('2a6dae41533ecd30db72b35da366a8a5')
sha512sums=('50f1455b5e65609af61c0337cb036e933042e7e00270e1f9a11070b34b41d9933f9dc003a7126569d3038cb15c0a9e55de123de6cec037ad514e281f1a27edb4')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Devel-StackTrace-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
