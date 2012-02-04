# Contributor: minimalist <minimalist@lavabit.com>
# Generator  : CPANPLUS::Dist::Arch 1.15

pkgname='perl-devel-patchperl'
pkgver='0.52'
pkgrel='1'
pkgdesc="Patch perl source a la Devel::PPPort's buildperl.pl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-pushd>=1.00')
makedepends=()
url='http://search.cpan.org/dist/Devel-PatchPerl'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Devel-PatchPerl-0.52.tar.gz')
md5sums=('a51c78173db234a3465cd7c6b1eddcd4')
_distdir="${srcdir}/Devel-PatchPerl-0.52"

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
