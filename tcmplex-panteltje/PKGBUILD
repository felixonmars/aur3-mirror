# Contributor: matto <matto@bloink110.de>
pkgname=tcmplex-panteltje
pkgver=0.4.7
pkgrel=1
pkgdesc="mpeg audio video multiplexer from the transcode for 8 audio channels"
url="http://ip51cf87c4.direct-adsl.nl/panteltje/dvd/"
license="GPL"
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ip51cf87c4.direct-adsl.nl/panteltje/dvd/$pkgname-$pkgver.tgz)
md5sums=(37010739a0fb44ed546e853a7c14c97f)

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp tcmplex-panteltje $startdir/pkg/usr/bin
}
