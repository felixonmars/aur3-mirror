# Contributor: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-data-dumper-concise
pkgver=2.020
pkgrel=2
pkgdesc='Less indentation and newlines plus sub deparsing'
arch=('any')
url='http://search.cpan.org/dist/Data-Dumper-Concise'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/F/FR/FREW/Data-Dumper-Concise-$pkgver.tar.gz")
md5sums=('8e2835a1304d680170e483093b330b70')

package() {
  cd "$srcdir/"*
  
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
}
