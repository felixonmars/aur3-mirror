# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Ismael Carnales <icarnales@gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>

_pkgname=ack2
pkgname=ack-git
pkgver=2.14.r96.g1cdf5bd
pkgrel=1
pkgdesc="Perl-based grep replacement, aimed at programmers with large trees of heterogeneous source code"
arch=('any')
url="http://betterthangrep.com/"
license=('GPL' 'PerlArtistic')
depends=('perl-file-next')
makedepends=('git')
provides=('ack')
conflicts=('ack')
options=('!emptydirs')
source=(git://github.com/petdance/ack2.git)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
