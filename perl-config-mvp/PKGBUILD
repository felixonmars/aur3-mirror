# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-config-mvp'
pkgver='2.200002'
pkgrel='1'
pkgdesc="multivalue-property package-oriented configuration"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0.17' 'perl-moose>=0.91' 'perl-moosex-oneargnew' 'perl-params-util' 'perl-role-hasmessage' 'perl-role-identifiable' 'perl-throwable' 'perl-tie-ixhash' 'perl-try-tiny')
makedepends=('perl-test-fatal')
url='http://search.cpan.org/dist/Config-MVP'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Config-MVP-$pkgver.tar.gz")
md5sums=('6dd4d363adb12ef4cc0cbf71dad78a56')
sha512sums=('346fe09771e095f5413e5cc5f38279fbae44ef6d0b13be860c0569dd21847dd9e416cba48c8f87044bc94e0a1289624541c4bc9dfd6d942a8e155f86049de68e')
_distdir="${srcdir}/Config-MVP-$pkgver"

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
