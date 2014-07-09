# Contributor: Max Roder <maxroder@web.de>
# Generator  : CPANPLUS::Dist::Arch 1.22
# Contributor: Joel Almeida <aullidolunar _at_ gmail dot c0m>

pkgname='perl-number-range'
pkgver='0.12'
pkgrel='1'
pkgdesc="Perl extension defining ranges of numbers and testing if a number is found in the range. You can also add and delete from this range"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/~larrysh/Number-Range/'
source=("http://search.cpan.org/CPAN/authors/id/L/LA/LARRYSH/Number-Range-${pkgver}.tar.gz")
md5sums=('5b518d99854f27c0f27c26fca7d54fea')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/Number-Range-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/Number-Range-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/Number-Range-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
