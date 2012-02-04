# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=perl-math-random
pkgver=0.71
pkgrel=1
pkgdesc='Some basic numeric stats on vectors'
arch=('any')
url='http://search.cpan.org/dist/Math-Random/'
license=('unknown')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/G/GR/GROMMEL/Math-Random-$pkgver.tar.gz")

build() {
  cd "$srcdir/Math-Random-$pkgver"
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  { /usr/bin/perl Makefile.PL &&
    make &&
    make test &&
    make install; } || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
# vim:set ts=2 sw=2 et:
md5sums=('55d7579c670ecd180f71fd157a2d2070')
