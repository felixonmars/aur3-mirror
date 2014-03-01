# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=coin-cgl
pkgver=0.58.6
pkgrel=1
pkgdesc="The COIN-OR Cut Generation Library (Cgl) is a collection of cut
generators"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Cgl"
license=('EPL')
groups=('coin-or')
depends=('coin-clp')
source=(http://www.coin-or.org/download/source/Cgl/Cgl-$pkgver.tgz)
sha512sums=('28fe2e570cb2ebfa3109ca53e5ebb7dd3a38e2ddcfda4d7a9a1d78d4784abe1b6ab79734e6cbcee48e21791fe8353658df47d11253b04366ccb66c3e566db585')

build() {
  cd Cgl-$pkgver
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

check() {
  cd Cgl-$pkgver
  make test
}

package() {
  cd Cgl-$pkgver
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir"/ install
}
