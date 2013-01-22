# Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-www-expand
pkgver=0.1.1
pkgrel=1
pkgdesc='Expand any URL shortener link'
arch=('any')
url='http://search.cpan.org/dist/WWW-Expand'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.06.2'
'perl-strictures>=1.000000'
'perl-libwww>=6.00')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/G/GL/GLITCHMR/WWW-Expand-$pkgver.tar.gz")
md5sums=('80ff63e2fbd10102488d358c241b7d49')

build() {
  cd "$srcdir/WWW-Expand-$pkgver"

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
