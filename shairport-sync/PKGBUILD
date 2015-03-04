# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=shairport-sync
pkgver=2.2.2
pkgrel=1
pkgdesc='Emulates an AirPort Express for the purpose of streaming music from iTunes and compatible iPods and iPhones'
url='https://github.com/mikebrady/shairport-sync'
arch=(i686 x86_64)
license=(GPL)
depends=(openssl avahi libsoxr popt alsa-lib)
source=(https://github.com/mikebrady/shairport-sync/archive/$pkgver.zip
        shairport-sync.service
        remove_rc.patch)
sha1sums=('5360f4bd6a6b9678a8d7d3c2006db2146cda2d69'
          '92a805adfc4cc97dfef1624efc6b1248ab5409f9'
          '48174838de1ef4672bd71511753f05fd845b7137')

prepare() {
  cd shairport-sync-$pkgver
  patch -p1 < ../remove_rc.patch
}

build() {
  cd shairport-sync-$pkgver

  autoreconf -i -f
  ./configure --prefix=/usr --with-alsa --with-avahi --with-ssl=openssl --with-soxr
  make
}

package() {
  cd shairport-sync-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 ../shairport-sync.service "$pkgdir"/usr/lib/systemd/system/shairport-sync.service
}
