# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-latex-table'
pkgver='1.0.6'
pkgrel='1'
pkgdesc="Perl extension for the automatic generation of LaTeX tables."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.76' 'perl-moosex-followpbp>=0.03' 'perl-template-toolkit>=0' 'perl>=5.8.0')
makedepends=()
checkdepends=('perl-test-nowarnings>=0')
url='http://search.cpan.org/dist/LaTeX-Table'
source=('http://search.cpan.org/CPAN/authors/id/L/LI/LIMAONE/LaTeX-Table-v1.0.6.tar.gz')
md5sums=('77943ac1154b78e3a9b3510c1849dd37')
sha512sums=('589b2b5f065348d15959af3d83040b54ab986bb8c5ec0c1e51f7a315230266dce5d6d3b43c9293ad2f6163fa3bddae62b825306c5a0a519f38903b50988f003a')
_distdir="LaTeX-Table-v1.0.6"

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
