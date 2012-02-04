# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=perl-math-vecstat
pkgver=0.08
pkgrel=1
pkgdesc='Some basic numeric stats on vectors'
arch=('any')
url='http://search.cpan.org/dist/Math-VecStat/VecStat.pm'
license=('unknown')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/A/AS/ASPINELLI/Math-VecStat-$pkgver.tar.gz")
md5sums=()

build() {
  cd "$srcdir/Math-VecStat-$pkgver"
  
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
md5sums=('3df23fb451f73bb49fd4ea344ba94020')
