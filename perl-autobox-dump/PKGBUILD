# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-autobox-dump'
pkgver='20090426.1746'
pkgrel='1'
pkgdesc="human/perl readable strings from the results of an EXPR"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-autobox')
url='http://search.cpan.org/dist/autobox-dump'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/COWENS/autobox-dump-20090426.1746.tar.gz')
md5sums=('22e22e1e7ce53846446979032f786573')
sha512sums=('e70c83788a3f55ed0e58df076849ecbff3700a22f8bbd95ad8fe2ef78d054b7979cde72ec250a76e7d9ba004c0b210814ad2b1149933d0c299e34e3aede8dace')
_distdir="autobox-dump-20090426.1746"

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
