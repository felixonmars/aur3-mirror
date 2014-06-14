# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-catalyst-action-rest'
pkgver='1.14'
pkgrel='1'
pkgdesc="Automated REST Method Dispatching"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.80030' 'perl-class-inspector>=1.13' 'perl-mro-compat>=0.10' 'perl-moose>=1.03' 'perl-params-validate>=0.76' 'perl-uri-find>=0' 'perl-libwww>=0' 'perl-namespace-autoclean>=0')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='http://search.cpan.org/dist/Catalyst-Action-REST'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FREW/Catalyst-Action-REST-1.14.tar.gz')
md5sums=('5b7167ca5dbfbe30cb615775d195dfe1')
sha512sums=('3741ff194f8b26ee24ef0e51d9d7af9995b04868bc7ca9a9ea03a9860003abe2b27712b70ef2158befd718a033f50ac16c1bdf3147bad6c0e6a087aedaecf0e9')
_distdir="Catalyst-Action-REST-1.14"

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
