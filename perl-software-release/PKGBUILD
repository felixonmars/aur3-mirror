# Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-software-release
pkgver=0.03
pkgrel=1
pkgdesc='Object representing a release of software'
arch=('any')
url='https://metacpan.org/module/Software::Release'
license=('GPL' 'PerlArtistic')
depends=('perl-moose')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/G/GP/GPHAT/Software-Release-$pkgver.tar.gz")
md5sums=('501ad181c360ba6704edefbf1c4f1673')

build() {
  cd "$srcdir/Software-Release-$pkgver"

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
