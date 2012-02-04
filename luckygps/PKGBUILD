# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=luckygps
pkgver=0.751
pkgrel=1
pkgdesc="Free tracking, gps and offline routing/navigation for linux."
arch=('i686' 'x86_64')
url="http://www.luckygps.com/"
license=('GPL')
depends=('qt' 'geos' 'proj')
optdepends=('gpsd: connect to GPS receiver')
source=(http://www.luckygps.com/wp/wp-content/uploads/downloads/2010/11/$pkgname-$pkgver-src.zip)
md5sums=('fb96f98e8e0ced09aa5c35577d35bb0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  qmake luckygps.pro PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
}
