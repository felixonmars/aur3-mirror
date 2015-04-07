# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-geo-shapefile'
pkgver='2.60'
pkgrel='1'
pkgdesc="Perl extension for handling ESRI GIS Shapefiles."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-tree-r>=0' 'perl-autovivification>=0' 'perl-rlib>=0')
makedepends=()
url='https://metacpan.org/release/Geo-ShapeFile'
source=('http://search.cpan.org/CPAN/authors/id/S/SL/SLAFFAN/Geo-ShapeFile-2.60.tar.gz')
md5sums=('25a95e2b9644b78a8d0810d1a5d3b13b')
sha512sums=('d9fbe383ab8b300a5bdb2f66806e6adfe41f9785c0185b68b252178381833779bbdff050332ee933caf878f44a14596dbad694bc702e51ce7345b278a8c6fa3d')
_distdir="Geo-ShapeFile-2.60"

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
