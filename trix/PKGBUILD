# Maintainer: Eugene Fominykh <junqed@gmail.com>
# Contributor: Eugene Fominykh
pkgname=trix
pkgver=0.94
pkgrel=1
pkgdesc="vypress compatible qt chat (can work without server)"
arch=('i686' 'x86_64')
url="http://trix.sourceforge.net"
license=('GPL')
depends=(qt3)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('0d49c6dd0e8d281062dfbbc43f92f91b')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
