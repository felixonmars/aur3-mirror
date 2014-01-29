# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-class-loader'
pkgver='2.03'
pkgrel='1'
pkgdesc="Load modules and create objects on demand."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Class-Loader'
source=('http://search.cpan.org/CPAN/authors/id/V/VI/VIPUL/Class-Loader-2.03.tar.gz')
md5sums=('2e2ace3429380e2dad2f0e82137511b8')
sha512sums=('1ca245ea55b6fb101c5a6000c833c5a7b6885619811882a693916d4bf9225ecb55127e340647c8d6ff70b18ee5b8ba9f15184c2a70e8b6737762fcd5baf76adc')
_distdir="Class-Loader-2.03"

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
