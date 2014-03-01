# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=coin-clp
pkgver=1.15.6
pkgrel=1
pkgdesc="Clp (Coin-or linear programming) is an open-source linear programming solver written in C++"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Clp"
license=('EPL')
groups=('coin-or')
depends=('coin-osi' 'zlib' 'bzip2' 'lapack')
source=(http://www.coin-or.org/download/source/Clp/Clp-$pkgver.tgz)
sha512sums=('a0da0cc5dcdd409c67cb67dd0f126a3d96bf59851543e7e08adbdbf01012a25905b58ded66aac50b06462ee3a147bed912740c00681417f8c228992a917748db')

build() {
  cd Clp-$pkgver
  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C
  make
}

check() {
  cd Clp-$pkgver
  make test
}

package() {
  cd Clp-$pkgver
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir"/ install
}
