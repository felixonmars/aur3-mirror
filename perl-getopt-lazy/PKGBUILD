pkgname=perl-getopt-lazy
pkgver=0.0.6
pkgrel=1
pkgdesc="Yet another lazy, minimal way of using Getopt::Long"
license="GPL"
url="http://cpan.uwinnipeg.ca/dist/Getopt-Lazy"
arch=('i686')
depends=(perl)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.cpan.org/modules/by-module/Getopt/Getopt-Lazy-v${pkgver}.tar.gz)
md5sums=('789ba3827c96ef968f1e3c75ad873d98')


perlver=$(pacman -Q perl | egrep -o '[0-9.]{5}')

build() {
  cd $startdir/src/Getopt-Lazy-v$pkgver
  /usr/bin/perl Makefile.PL
  # ugly hack to make install location
  # compatible with newer versions of perl.
  /bin/sed -i "s:$perlver:current:g" Makefile
  /usr/bin/make || return 1
  /usr/bin/make install DESTDIR=$startdir/pkg
}
