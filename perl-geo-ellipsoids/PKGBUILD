# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-geo-ellipsoids'
pkgver='0.16'
pkgrel='1'
pkgdesc="Package for standard Geo:: ellipsoid a, b, f and 1/f values."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-geo-constants>=0.04' 'perl-geo-functions>=0.03')
makedepends=()
url='http://search.cpan.org/dist/Geo-Ellipsoids'
source=('http://search.cpan.org/CPAN/authors/id/M/MR/MRDVT/Geo-Ellipsoids-0.16.tar.gz')
md5sums=('eb39a72efb4a14c61559a0dfc36cdc69')
sha512sums=('fe966a24f659771d591da3eb1d06cdbb983ad059844412bb6f472a3a72abf7864af37a62b2261c4bcc8987f8376ffb76fd43fea93b994c59b31d20bf88f6212c')
_distdir="Geo-Ellipsoids-0.16"

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
