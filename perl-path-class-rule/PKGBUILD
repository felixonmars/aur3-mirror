# Packager: Dylan William Hardison <dylan@hardison.net>

pkgname=perl-path-class-rule
pkgver=0.011
pkgrel=1
pkgdesc="File finder using Path::Class"
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(
  'perl'
  'perl-path-class'
  'perl-number-compare'
  'perl-try-tiny'
  'perl-text-glob')
makedepends=("perl-test-deep")
url=https://metacpan.org/release/Path-Class-Rule
source=("http://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/Path-Class-Rule-${pkgver}.tar.gz")
md5sums=('d78abe46dcf4fbc0aceb13e0ce9288a4')
_distdir="${srcdir}/Path-Class-Rule-${pkgver}"

build()
(
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
)

check()
(
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    cd "$_distdir"
    make test
)

package() {
    cd "$_distdir"
    make install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
