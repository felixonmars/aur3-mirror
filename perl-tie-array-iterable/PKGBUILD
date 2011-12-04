# Contributor: Natal Ngétal <hobbestigrou@erakis.im>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-tie-array-iterable'
pkgver='0.03'
pkgrel='1'
pkgdesc="Allows creation of iterators for lists and arrays"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Tie-Array-Iterable'
source=('http://search.cpan.org/CPAN/authors/id/M/MN/MNEYLON/Tie-Array-Iterable-0.03.tar.gz')
md5sums=('edf2abf85390328b59780b8beeb01516')
sha512sums=('27cbbbd07ed941314e7b73c6fdf80272c35d84db7dfaaf7240dca68977f0982a0393f67a396863f67bb65372a6aeac399c778bb1775f550260628764cb74d63f')
_distdir="${srcdir}/Tie-Array-Iterable-0.03"

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
