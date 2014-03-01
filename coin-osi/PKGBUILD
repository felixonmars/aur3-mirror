# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=coin-osi
pkgver=0.106.6
pkgrel=1
pkgdesc="Osi (Open Solver Interface) provides an abstract base class to a generic linear programming (LP) solver, along with derived classes for specific solvers."
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Osi"
license=('EPL')
groups=('coin-or')
depends=('coin-utils')
source=(http://www.coin-or.org/download/source/Osi/Osi-$pkgver.tgz)
sha512sums=('25d2dd1791b73329fa9bc32f7b4a4f3d0600ce600868bd14d902dd0ea1c6f5a2eca4bff01ac65ea2843e725fd5c218fca6def9d6974e6af9692c47973b6202ef')

build() {
  cd Osi-$pkgver

  COIN_SKIP_PROJECTS="Sample" \
  ./configure --prefix=/usr \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" -C

  make
}

check() {
  cd Osi-$pkgver
  make test
}

package() {
  cd Osi-$pkgver
  PKG_CONFIG_LIBDIR="$pkgdir"/usr/lib/pkgconfig/ \
  make DESTDIR="$pkgdir"/ install
}
