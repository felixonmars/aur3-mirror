# Maintainer: Gabriel Ebner <gebner@gebner.org>
pkgname=qmaxsat
pkgver=0.4a
pkgrel=1
pkgdesc="A partial MaxSAT solver based on the SAT solver MiniSat."
arch=('x86_64')
url="https://sites.google.com/site/qmaxsat/"
license=('MIT')
depends=('gcc-libs' 'zlib')
source=("https://sites.google.com/site/qmaxsat/download/qmaxsat-v${pkgver}.tgz")
md5sums=('b4e966a0c0dd930eaea597fb1238e0da')

build() {
  cd "$srcdir/$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgver"
  install -D -m0755 minisat "$pkgdir/usr/bin/qmaxsat"
  install -D -m0644 ../LICENSE "$pkgdir/usr/share/licenses/qmaxsat/LICENSE"
}
