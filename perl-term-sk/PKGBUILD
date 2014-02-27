# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-term-sk'
pkgver='0.14'
pkgrel='1'
pkgdesc="Perl extension for displaying a progress indicator on a terminal."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Term-Sk'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KEICHNER/Term-Sk-0.14.tar.gz')
md5sums=('5dfa91a1a049007bce33387b047ca864')
sha512sums=('c0c156324bdfea439874bb53ed623d46e81a0d9fa26d1f74bfb974cd914c789f4655657e790865f76c9d8b91ed4d3cb37ca208e6e6ebd4cd445fc48c6b94adcb')
_distdir="Term-Sk-0.14"

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
