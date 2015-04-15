# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-odf-lpod'
pkgver='1.126'
pkgrel='1'
pkgdesc="An OpenDocument management interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-archive-zip>=1.30' 'perl-file-slurp>=0' 'perl-file-type>=0' 'perl-image-size>=0' 'perl-xml-twig>=3.34' 'perl-libwww>=0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/ODF-lpOD'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMGDOC/ODF-lpOD-1.126.tar.gz')
md5sums=('3aed7e0e055881f8576fce86cf5bd9c1')
sha512sums=('a4923f6345f31240cca86272a0c2ff3b2fc115702eb96fd2f28fe8754110092c85019f484f73717287cbb9e9b2d89e61aa9ea0ca45214630e580c2a8fe724231')
_distdir="ODF-lpOD-1.126"

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
