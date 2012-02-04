# Contributor: Natal Ngétal <hobbestigrou@erakis.im>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-relative'
pkgver='0.04'
pkgrel='1'
pkgdesc="Load modules with relative names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-universal-require')
makedepends=()
url='http://search.cpan.org/dist/relative'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SAPER/relative-0.04.tar.gz')
md5sums=('923b48653599f2f7fcc7eba12db462ea')
sha512sums=('0aa397524b8f1a4ced037ddb65e228b7d2acacc9580c7aa800673168d03a4a80ac0c3805bfd7d91e90fbc054ceb2d1b5dc0980ef99c35cbd3e15a55148ff71b0')
_distdir="${srcdir}/relative-0.04"

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
