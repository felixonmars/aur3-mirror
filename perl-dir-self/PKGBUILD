# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-dir-self'
pkgver='0.11'
pkgrel='1'
pkgdesc="a __DIR__ constant for the directory your source file is in"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Dir-Self'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAUKE/Dir-Self-0.11.tar.gz')
md5sums=('e484446c3aa042737c0b7cbd0fb2f904')
sha512sums=('c2795149e74c71037fab8c3149e85e11d4ee77dbb54f85d07e49c39504b3ba910a5ded32831adf36915b302abc4ced386dcd51b6dfbaef46e069c803793e8efc')
_distdir="Dir-Self-0.11"

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
