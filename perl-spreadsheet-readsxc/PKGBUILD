# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-spreadsheet-readsxc'
pkgver='0.20'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=0' 'perl-xml-parser>=0')
makedepends=()
url='https://metacpan.org/release/Spreadsheet-ReadSXC'
source=('http://search.cpan.org/CPAN/authors/id/T/TE/TERHECHTE/Spreadsheet-ReadSXC-0.20.tar.gz')
md5sums=('292ea343ef11e1a417751eaff24bb982')
sha512sums=('9195ea28795be0557a4da2feef3d97f796dc93b919c29f6d57f4ccaf70a1c25326f86fc51ac2b73123b5f90364c2bccd9df0ceff77b432cc397b3484616df92d')
_distdir="Spreadsheet-ReadSXC-0.20"

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
