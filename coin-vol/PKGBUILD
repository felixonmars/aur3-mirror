# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=coin-vol
pkgver=1.4.4
pkgrel=1
pkgdesc="Vol (Volume Algorithm) is an open-source implementation of a subgradient method that produces primal as well as dual solutions."
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Vol"
license=('EPL')
groups=('coin-or')
depends=('coin-osi')
source=(http://www.coin-or.org/download/source/Vol/Vol-$pkgver.tgz)
sha512sums=('20e04efac09694ddfa035496ec9b2920ef702e5a2ec4515cd88c52129c783efd3c25e044e6c2cec67ad800b297ebd03f3c3c377f58829790109d8d6dcb40cc39')

build() {
  cd Vol-$pkgver
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

package() {
  cd Vol-$pkgver
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir"/ install
}
