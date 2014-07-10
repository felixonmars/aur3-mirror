# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-geo-distance-xs'
pkgver='0.13'
pkgrel='1'
pkgdesc="speed up Geo::Distance"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.19' 'perl-geo-distance>=0.16')
makedepends=()
url='http://search.cpan.org/dist/Geo-Distance-XS'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRAY/Geo-Distance-XS-0.13.tar.gz')
md5sums=('80d7208ad23fd04d15fce1b5eee73bd5')
sha512sums=('43e42062f7d47d611291807dfc539f906cc8d0390b435a89e49ec4f7724a0bc47092a69aea685e5af9a49b651a153f11819bfa09d94d0dcc5310fc686de42df8')
_distdir="Geo-Distance-XS-0.13"

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
