# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=coin-cbc
pkgver=2.8.9
pkgrel=1
pkgdesc="Cbc (Coin-or branch and cut) is an open-source mixed integer programming solver written in C++."
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Cbc"
license=('EPL')
groups=('coin-or')
depends=('coin-vol' 'coin-cgl')
source=(http://www.coin-or.org/download/source/Cbc/Cbc-$pkgver.tgz)
sha512sums=('ff537a46a8a266767817bc28d61f4541cfda6e8617c857fa0abef4c0b4ef8fbc728dd195645898d94130dfaedb258789bf55e189a0b9665590958355135f020e')

build() {
  cd Cbc-$pkgver
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-vol-lib="$(pkg-config --libs vol)" \
              --with-vol-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

check() {
  cd Cbc-$pkgver
  make test
}

package() {
  cd Cbc-$pkgver
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir"/ install
}
