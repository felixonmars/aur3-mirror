# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Module author: Nigel Wetters Gourlay 
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-ip-country'
pkgver='2.28'
pkgrel='2'
pkgdesc="fast lookup of country codes from IP addresses"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-geography-countries')
makedepends=()
url='http://search.cpan.org/dist/IP-Country'
source=('http://search.cpan.org/CPAN/authors/id/N/NW/NWETTERS/IP-Country-2.28.tar.gz')
md5sums=('dcca005cee156935b34a16e1bbddb00e')
sha512sums=('3596014eaeb7d0be8edd9b98c2f31e83587cc48c738837eaa78e9dc6c7ee6cee371a7bc230f28fa2901b9eece7fe0fa2126135a3d90d1261488d61cedcec25ac')
_distdir="IP-Country-2.28"

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
