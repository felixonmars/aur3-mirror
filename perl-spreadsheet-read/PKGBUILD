# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-spreadsheet-read'
pkgver='0.60'
pkgrel='1'
pkgdesc="Read the data from a spreadsheet"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy>=0')
makedepends=()
checkdepends=('perl-test-nowarnings>=0')
url='https://metacpan.org/release/Spreadsheet-Read'
source=('http://search.cpan.org/CPAN/authors/id/H/HM/HMBRAND/Spreadsheet-Read-0.60.tgz')
md5sums=('e1f5f383635ebd5248fb0b87480f2860')
sha512sums=('c3778f186a6483d5681587bc29b7dd17d603bcc07edfd8504b7e07c6b729ca05e771e269445401baf45139c9c102a0be621360e37f50257b59304651a626acfe')
_distdir="Spreadsheet-Read-0.60"

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
