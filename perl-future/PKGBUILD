# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-future'
pkgver='0.30'
pkgrel='1'
pkgdesc="represent an operation awaiting completion"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-identity>=0' 'perl-test-refcount>=0')
url='http://search.cpan.org/dist/Future'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Future-0.30.tar.gz')
md5sums=('21bdf92c22915b06b2e27ea4e0d90cbc')
sha512sums=('19a7880575e3557afd9d3ee22ec3cf15910b6fbd92d0016b436db3363e31d725296aa41999648c2bd42d6de9da2f668097e360cf20f250361f7a7d1ab8ce8699')
_distdir="Future-0.30"

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
