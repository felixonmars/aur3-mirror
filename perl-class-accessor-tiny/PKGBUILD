# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-class-accessor-tiny'
pkgver='0.10'
pkgrel='1'
pkgdesc="Perl Tiny Accessors for PBP"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='http://search.cpan.org/dist/Class-Accessor-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRIAN/Class-Accessor-Tiny-0.10.tar.gz')
md5sums=('5e4a88f9549a39dd00b0ccd5065c3d87')
sha512sums=('2009d9fd59d1865794ab40f7109f97c6e8f43ac84a23840d7a5548cbb2716d1e9855b566131195fae6fc5acccf316627d88d66e63381cd5f1651d4d1e9623df6')
_distdir="Class-Accessor-Tiny-0.10"

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
