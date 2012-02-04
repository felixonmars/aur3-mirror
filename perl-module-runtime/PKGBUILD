# Contributor: Isaac Good <isaacgood@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-module-runtime'
pkgver='0.010'
pkgrel='1'
pkgdesc="runtime module handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-params-classify')
makedepends=('perl>=5.006')
url='http://search.cpan.org/dist/Module-Runtime'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Module-Runtime-0.010.tar.gz')
md5sums=('069e890c996c99d283070e7aad3de10b')
_distdir="${srcdir}/Module-Runtime-0.010"

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
