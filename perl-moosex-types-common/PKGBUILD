# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-types-common'
pkgver='0.001012'
pkgrel='1'
pkgdesc="A library of commonly used type constraints"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moosex-types>=0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-warnings>=0.005')
url='http://search.cpan.org/dist/MooseX-Types-Common'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Types-Common-0.001012.tar.gz')
md5sums=('9acfbf718d46a9ee1d2198d6b59e40fa')
sha512sums=('af2c3f0081cca298ad3a828ee72143e7a51c4960432f6bcada380585a3ff89855cf6944e65900d36fbdbcc66200cab5fb8b91b4e9403a527715680b4700eebd9')
_distdir="MooseX-Types-Common-0.001012"

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
