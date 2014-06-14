# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-moosex-classattribute'
pkgver='0.27'
pkgrel='1'
pkgdesc="Declare class attributes Moose-style"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils>=0' 'perl-moose>=2.00' 'perl-namespace-autoclean>=0.11' 'perl-namespace-clean>=0.20')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-requires>=0.05')
url='http://search.cpan.org/dist/MooseX-ClassAttribute'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/MooseX-ClassAttribute-0.27.tar.gz')
md5sums=('c04618bef2be16248fb9b5357883a699')
sha512sums=('0734fc114f717aca8ea9860c978d8898b2db69bda8d4b2ac7f9d269c38154fb800a0eb07318e02ec0be9bb38df91f8909aa34181f7bb5b55572051195d8da256')
_distdir="MooseX-ClassAttribute-0.27"

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
