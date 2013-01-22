 # Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-tap-simpleoutput
pkgver=0.001
pkgrel=2
pkgdesc='Simple closure-driven TAP generator'
arch=('any')
url='https://metacpan.org/module/TAP::SimpleOutput'
license=('LGPL2')
depends=('perl-sub-exporter')
makedepends=('perl-file-temp')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSRCHBOY/TAP-SimpleOutput-$pkgver.tar.gz")
md5sums=('da9be0d0e662742e17ab2145c9039233')

build() {
  cd "$srcdir/TAP-SimpleOutput-$pkgver"

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
