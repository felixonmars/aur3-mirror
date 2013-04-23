# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=ecp
pkgver=0.1.5beta
pkgrel=4
pkgdesc="An extended version of the GNU coreutils' cp"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/ecp/"
license=('GPL')
source=(http://download.savannah.nongnu.org/releases/$pkgname/$pkgname.$pkgver.tar.gz)
md5sums=('4c3d3df776796c2fd7db839ec72e040d')

build() {
  cd $srcdir/$pkgname.$pkgver
  make
}

package() {
  cd $srcdir/$pkgname.$pkgver
  install -D ecp $pkgdir/usr/bin/ecp
  install -Dm 644 doc/ecp.1.gz $pkgdir/usr/share/man/man1/ecp.1.gz
}
