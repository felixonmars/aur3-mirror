# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-biblio-citation-parser'
pkgver='1.10'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-text-unidecode>=0' 'perl-uri>=0')
makedepends=()
url='http://search.cpan.org/dist/Biblio-Citation-Parser'
source=('http://search.cpan.org/CPAN/authors/id/M/MJ/MJEWELL/citeparser/Biblio-Citation-Parser-1.10.tar.gz')
md5sums=('2147e8b0102da135ae18e0a95f5f5502')
sha512sums=('422afcb9071291e03100a8d1210b14480c76f207d2caccb7058b945a78252a9be4202c81038e2e8d75f1b51abfdc890545f91546edab8ed5761c0a7624e4d87f')
_distdir="Biblio-Citation-Parser-1.10"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
