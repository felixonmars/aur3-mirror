# Contributor: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-config-file
pkgver=1.50
pkgrel=1
pkgdesc='Parse a simple configuration file'
arch=('any')
url='http://search.cpan.org/dist/Config-File'
license=('GPL')
depends=('perl')
makedepends=('perl-test-pod'
'perl-test-pod-coverage')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/G/GW/GWOLF/Config-File-$pkgver.tar.gz")
md5sums=('ea1f012b4336697be1c2e4cc2c3396e0')

build() {
  cd "$srcdir/Config-File-$pkgver"
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Build.PL
  { /usr/bin/perl Build.PL &&
    ./Build &&
    ./Build test &&
    ./Build install; } || return 1
}
