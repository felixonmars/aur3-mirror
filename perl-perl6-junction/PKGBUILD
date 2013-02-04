# Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-perl6-junction
pkgver=1.50000
pkgrel=2
pkgdesc='Perl6 style Junction operators in Perl5'
arch=('any')
url='https://metacpan.org/module/Perl6::Junction'
license=('LGPL2')
depends=('perl')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/C/CF/CFRANKS/Perl6-Junction-$pkgver.tar.gz")
md5sums=('23fd0b6fa51706a2abd11816e9d19959')

build() {
  cd "$srcdir/Perl6-Junction-$pkgver"

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Makefile.PL &&
    make &&
    make test &&
    make install; } || return 1
}
