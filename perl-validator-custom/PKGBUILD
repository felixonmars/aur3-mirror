# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-validator-custom'
pkgver='0.23'
pkgrel='1'
pkgdesc="HTML form Validation, easy and flexibly"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-object-simple>=3.0.621')
makedepends=()
url='http://search.cpan.org/dist/Validator-Custom'
source=('http://search.cpan.org/CPAN/authors/id/K/KI/KIMOTO/Validator-Custom-0.23.tar.gz')
md5sums=('2eb0ba58dc8ebd860cdbef5c19c6dcdf')
sha512sums=('7df5103f6a1087ff04bfdfad383b03999156f9ce3acbb52765127bcf2bd102031af841a609b9892c16f7cda857d9a710a0c505b61cdc51d0b54c4ad938701b1a')
_distdir="Validator-Custom-0.23"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
