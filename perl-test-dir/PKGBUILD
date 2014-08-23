# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-test-dir'
pkgver='1.014'
pkgrel='1'
pkgdesc="test directory attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Test-Dir'
source=('http://search.cpan.org/CPAN/authors/id/M/MT/MTHURN/Test-Dir-1.014.tar.gz')
md5sums=('8186affbc9aa841916a1f64c84b19fbd')
sha512sums=('d314ad2aea917550b47af75845ac74c5dbf838881f98fa7d38c6dabbd4e5bad2c21ae2bca569bd55cf3a9fa180dc37a847693af0fcf43956deb6413beff0066a')
_distdir="Test-Dir-1.014"

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
