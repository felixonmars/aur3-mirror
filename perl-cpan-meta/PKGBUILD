# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.19
# PKGBUILD Version history: https://github.com/ChimeraCoder/PKGBUILDS

pkgname='perl-cpan-meta'
pkgver='2.142690'
pkgrel='1'
pkgdesc="the distribution metadata for a CPAN dist"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-cpan-meta-requirements' 'perl-parse-cpan-meta>=1.4403')
makedepends=()
url='http://search.cpan.org/dist/CPAN-Meta'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/CPAN-Meta-${pkgver}.tar.gz")
md5sums=('753bcb213e794e1e39e5a1c6ed8ddf02')
sha512sums=('0e5d8ac79726fdb45c284b76a8489eeb12f3376fa235f51a16bea59daebb0870d1eaecd5ca33afc85b4499b900cc03d7cfae46c4759d9b0164cb54d9423fbc24')
_distdir="${srcdir}/CPAN-Meta-${pkgver}"

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/CPAN-Meta-${pkgver}"
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
