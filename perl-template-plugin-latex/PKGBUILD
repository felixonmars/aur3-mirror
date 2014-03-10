# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-template-plugin-latex'
pkgver='3.05'
pkgrel='1'
pkgdesc="Template Toolkit plugin for Latex"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-latex-driver>=0.07' 'perl-latex-encode>=0.02' 'perl-latex-table>=0' 'perl-template-toolkit>=0')
makedepends=()
url='http://search.cpan.org/dist/Template-Plugin-Latex'
source=('http://search.cpan.org/CPAN/authors/id/E/EI/EINHVERFR/Template-Plugin-Latex-3.05.tar.gz')
md5sums=('3911446a1a6232847a127662bef1a645')
sha512sums=('111972ffc41e71e2de286c1790bb9597c12ea5b4f71b9baa8f80470b5d5e2e63ee5972b9944fe9fe97f0b1e50c5eb81fc7054173da0deb9497ff16c0e75188c4')
_distdir="Template-Plugin-Latex-3.05"

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
