# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-moosex-types-loadableclass'
pkgver='0.012'
pkgrel='1'
pkgdesc="ClassName type constraint with coercion to load the class."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0' 'perl-module-runtime>=0' 'perl-moose>=0' 'perl-moosex-types>=0' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='http://search.cpan.org/dist/MooseX-Types-LoadableClass'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-LoadableClass-0.012.tar.gz')
md5sums=('7cc6a67656af0d91fd29c639d6716393')
sha512sums=('8198d5d30d1a59c5b3dd24be2c33138e28b9d92bfce3d081f29b82de5ded90c53b03d23b228a80a2d62d164cfbd96e87054b509cc78acac6d65737f6de5d913b')
_distdir="MooseX-Types-LoadableClass-0.012"

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
