# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-geo-functions'
pkgver='0.07'
pkgrel='1'
pkgdesc="Package for standard Geo:: functions."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-geo-constants>=0.06')
makedepends=()
url='http://search.cpan.org/dist/Geo-Functions'
source=('http://search.cpan.org/CPAN/authors/id/M/MR/MRDVT/Geo-Functions-0.07.tar.gz')
md5sums=('d0e663a0445a9d5dd6606acdd4f5052d')
sha512sums=('cf53bdff3b8f4ac540402f6570fca501d2823f189e05f393b16d23fa0e39831717376f67a26640ce6603eebbb3d6d997762343160299e5ea0e6e5455076af77c')
_distdir="Geo-Functions-0.07"

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
