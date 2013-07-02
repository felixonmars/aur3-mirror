# Maintainer: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Fabrizio Antonangeli <fabrizio.antonangeli@gmail.com>

pkgname=dfu-util
pkgver=0.7
pkgrel=2
pkgdesc="Allow you to connect to the FreeRunner through the USB cable and flash it"
url="http://wiki.openmoko.org/wiki/Dfu-util"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libusbx')
source=(http://dfu-util.gnumonks.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=('56844020177d4db4c1ea2e926fe9d588')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
