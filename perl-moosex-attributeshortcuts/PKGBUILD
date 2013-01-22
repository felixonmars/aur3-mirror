# Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-moosex-attributeshortcuts
pkgver=0.017
pkgrel=1
pkgdesc='Shorthand for common attribute options'
arch=('any')
url='https://metacpan.org/module/MooseX::AttributeShortcuts'
license=('LGPL2')
depends=('perl-moose'
'perl-moosex-role-parameterized'
'perl-moosex-types-common'
'perl-moosex-types'
'perl-namespace-autoclean')
makedepends=('perl-file-temp'
'perl-test-fatal'
'perl-test-moose-more>=0.017')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSRCHBOY/MooseX-AttributeShortcuts-$pkgver.tar.gz")
md5sums=('4d147a60f567e73c1c7547df5d6f5bfd')

build() {
  cd "$srcdir/MooseX-AttributeShortcuts-$pkgver"

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
