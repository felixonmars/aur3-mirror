# CPAN Name  : Package-Stash
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-package-stash'
pkgver='0.33'
pkgrel='1'
pkgdesc="routines for manipulating stashes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-checkconflicts>=0.02' 'perl-package-deprecationmanager' 'perl-package-stash-xs>=0.24')
makedepends=('perl-dist-checkconflicts>=0.02' 'perl-test-fatal' 'perl-test-requires')
conflicts=('perl-class-mop<=1.08'
  'perl-moosex-role-withoverloading<=0.08'
  'perl-namespace-clean<=0.18')
url='http://search.cpan.org/dist/Package-Stash'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Package-Stash-0.33.tar.gz')
md5sums=('fe1f6efa0dbd46f8520903b436f185f1')
_distdir="${srcdir}/Package-Stash-0.33"

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
