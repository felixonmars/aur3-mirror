# CPAN Name  : Sort-Array
# Contributor: Nik Anachi <nik.anachi@gmail.com>

pkgname='perl-sort-array'
pkgver='0.26'
pkgrel='1'
pkgdesc="This extended sorting algorithm allows you to sort an array by any field number"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/~midi/Sort-Array-0.26/'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIDI/Sort-Array-0.26.tar.gz')
md5sums=('9743023430bc3f5ccd8afc7ebd72d91a')

build() {
  PERL=/usr/bin/perl
  DIST_DIR="${srcdir}/Sort-Array-0.26"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { cd "$DIST_DIR" &&
    $PERL Makefile.PL &&
    make &&
    make test &&
    make install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
