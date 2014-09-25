# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=goaccess
pkgver=0.8.5
pkgrel=1
pkgdesc='A real-time web log analyzer and interactive viewer that runs in a terminal'
arch=(i686 x86_64)
license=(GPL2)
url='http://goaccess.io/'
backup=(etc/goaccess.conf)
depends=(geoip glib2)
source=(https://github.com/allinurl/goaccess/archive/v$pkgver.zip)
sha1sums=('be44b8bd192bb1c6f5418c8ff363feeded2cfd2f')

build() {
  cd $pkgname-$pkgver
  autoreconf -fiv
  ./configure --enable-geoip --enable-utf8 --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
