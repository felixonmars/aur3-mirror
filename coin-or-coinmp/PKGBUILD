pkgname=coin-or-coinmp
pkgver=1.8.0
pkgrel=1
pkgdesc="C-API library that supports most of the functionality of CLP (Coin LP), CBC (Coin Branch-and-Cut), and CGL (Cut Generation Library) projects"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/CoinMP"
license=('EPL')
groups=('coin-or')
depends=('coin-or-cbc')
options=('!emptydirs')
source=(http://www.coin-or.org/download/source/CoinMP/CoinMP-$pkgver.tgz)
sha1sums=('72fb7ee9ef7043f75ef1aac9bc9053cca321af3a')

build() {
  cd CoinMP-$pkgver
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-cbc-lib="$(pkg-config --libs cbc)" \
              --with-cbc-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

check() {
  cd CoinMP-$pkgver
  make test
}

package() {
  cd CoinMP-$pkgver/CoinMP
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir"/ install

  # thanks, autotools…
  mv "$pkgdir/$pkgdir"/usr/share/coin/doc/CoinMP/* "$pkgdir"/usr/share/coin/doc/CoinMP/
}
