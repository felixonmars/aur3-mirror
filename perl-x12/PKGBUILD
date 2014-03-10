# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-x12'
pkgver='0.80'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/X12'
source=('http://search.cpan.org/CPAN/authors/id/P/PR/PRASAD/X12-0.80.tar.gz')
md5sums=('1da488a9c048a657174cf55a2a2707a4')
sha512sums=('8370da3910ad5f3d904aa420aed101b7b54d56b693aafd31e58669b2b15c847bfb4beef9469f7dc9075b9eb95a659c64ba6fa2876a5d6710517b418080da2eca')
_distdir="X12-0.80"

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
