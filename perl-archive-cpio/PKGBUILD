# Contributor: cgm <cgm@00ff.net>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-archive-cpio'
pkgver='0.09'
pkgrel='1'
pkgdesc="module for manipulations of cpio archives"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Archive-Cpio'
source=('http://search.cpan.org/CPAN/authors/id/P/PI/PIXEL/Archive-Cpio-0.09.tar.gz')
md5sums=('15e390c418b0762689c7be3641971741')
sha512sums=('6e1fb4488be6434571c82e930c3da51642ea6759769abbebefc4a9b597f3965ecf7d220cfb4d13d6448abaf74bb63d8bb92a6ceec78f2a387b0708d17fcb3a54')
_distdir="${srcdir}/Archive-Cpio-0.09"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
