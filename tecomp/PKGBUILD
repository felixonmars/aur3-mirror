# Contributor: Katharina Brandl <kathi.brandl@gmx.de>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=tecomp
pkgver=0.24.1
_rev=r477
pkgrel=1
pkgdesc="An Eiffel compiler"
arch=('i686' 'x86_64')
url="http://tecomp.sourceforge.net"
license=('GPL')
depends=(gcc-libs)
makedepends=(make gcc)
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}-${pkgver}_$_rev.tar.gz")
md5sums=('07d2c559afd7521677620039bad2207e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make install
}

# vim:set ts=2 sw=2 et:

