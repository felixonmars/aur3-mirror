# Maintainer: Peter Wu <peter@lekensteyn.nl>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=lib32-geoip
pkgver=1.6.2
pkgrel=1
pkgdesc="Non-DNS IP-to-country resolver C library & utils"
arch=('x86_64')
url="http://www.maxmind.com/app/c"
license=('GPL')
depends=('lib32-zlib' 'geoip-database')
options=('!emptydirs')
source=(https://github.com/maxmind/geoip-api-c/archive/v${pkgver}.tar.gz)
sha256sums=('72562fc10792eea6cfa662d93ef40c6541b73619df8057a6e411144e671a9174')

prepare() {
  cd geoip-api-c-$pkgver
  autoreconf -vi
}

build() {
  cd geoip-api-c-$pkgver

  export CFLAGS="$CFLAGS -m32"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc/geoip
  make
}

check() {
  cd geoip-api-c-$pkgver
  ln -sf /usr/share/GeoIP data
  make check
}

package() {
  cd geoip-api-c-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/"{bin,include,share}
}

# vim:set ts=2 sw=2 et:
