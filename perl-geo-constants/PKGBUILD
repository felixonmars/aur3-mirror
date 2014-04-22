# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-geo-constants'
pkgver='0.06'
pkgrel='1'
pkgdesc="Package for standard Geo:: constants."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Geo-Constants'
source=('http://search.cpan.org/CPAN/authors/id/M/MR/MRDVT/Geo-Constants-0.06.tar.gz')
md5sums=('4b2f4775adc2939210b6235ae0669542')
sha512sums=('603624b0bf350ec9254a5f2be1b8d88d14a4e9067f109288b15db1aeb9d0b463e71334ef6e4495e76edd273cb52ef98fc08934696640f09438f37b4129a35c4c')
_distdir="Geo-Constants-0.06"

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
