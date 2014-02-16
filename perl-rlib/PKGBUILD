# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-rlib'
pkgver='0.02'
pkgrel='1'
pkgdesc="manipulate @INC at compile time with relative paths"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/rlib'
source=('http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/rlib-0.02.tar.gz')
md5sums=('23cc12e9c1cb968ef44a81c51cf95278')
sha512sums=('cb9ed13db8a5709e19464412d46f8d818004d8cac339ec78e6314c1f05cadde784a4454f654b5db5ae17ed25b2107b8e3e7b68766405a270b67c06fed6defaa5')
_distdir="rlib-0.02"

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
