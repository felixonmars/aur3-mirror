# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-type-tiny-xs'
pkgver='0.010'
pkgrel='1'
pkgdesc="provides an XS boost for some of Type::Tiny's built-in type constraints"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='http://search.cpan.org/dist/Type-Tiny-XS'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Type-Tiny-XS-0.010.tar.gz')
md5sums=('41107c81eff706407ea37fe1ce0bc158')
sha512sums=('e523db358d2be99c5465a8694562a578d61a06d29f35ea5671be4301782a89b9fd8d0a7411463956be7be5541269e1e2aa50865c2ef088ee03c53b6967ef0e6f')
_distdir="Type-Tiny-XS-0.010"

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
