# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-algorithm-line-bresenham'
pkgver='0.11'
pkgrel='1'
pkgdesc="simple pixellated line-drawing algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='http://search.cpan.org/dist/Algorithm-Line-Bresenham'
source=('http://search.cpan.org/CPAN/authors/id/O/OS/OSFAMERON/Algorithm-Line-Bresenham-0.11.tar.gz')
md5sums=('585d4fe2925e13a1f2605b6455083c58')
sha512sums=('bb592ded94a7a05a6d3ffec8c0cec30ccefd262fcd5c5b12a29ecd61c529fc03803fa16543863795594f8c249c98b62e8d39c1849b995b14923326172f16f14e')
_distdir="${srcdir}/Algorithm-Line-Bresenham-0.11"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
