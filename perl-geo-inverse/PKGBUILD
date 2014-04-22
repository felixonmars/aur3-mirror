# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-geo-inverse'
pkgver='0.05'
pkgrel='1'
pkgdesc="Calculate geographic distance from a lat & lon pair."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-geo-constants>=0.04' 'perl-geo-ellipsoids>=0.09' 'perl-geo-functions>=0.03')
makedepends=()
url='http://search.cpan.org/dist/Geo-Inverse'
source=('http://search.cpan.org/CPAN/authors/id/M/MR/MRDVT/Geo-Inverse-0.05.tar.gz')
md5sums=('efe4c3097bb920d52dc2c21aba2f3357')
sha512sums=('bece1091bac6ee979cf83639214febd04fa72f9d1160f8c1545fb19de97b788d9b1c802fddcc7a680297cb992756e606430e40ce0bc7bd59dd098e862d349524')
_distdir="Geo-Inverse-0.05"

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
