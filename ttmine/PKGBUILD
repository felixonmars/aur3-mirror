# Contributor: Nikolai Wyderka <nikolai [at] wyderka [dot] de>
pkgname=ttmine
pkgver=0.51
pkgrel=1
pkgdesc="A console based minesweeper clone"
arch=('i686' 'x86_64')
url="http://www.pspace.org/projects/36-programmes/55-ttmine-a-console-based-minesweeper-clone"
license=('WTFPL')
conflicts=('ttmine-bin')
depends=()
makedepends=('fpc')
optdepends=()
install=
source=("http://www.pspace.org/downloads/$pkgname-$pkgver-src.tar.gz")
md5sums=('5009b8efd20bc76af6c58f42b712ea44')
sha256sums=('c597e44bdef90f6c9efb879f40dc4deb5c75539986b086be392d3a243a1ac3ee')

build() {
  cd "$srcdir/"
  ./compile.sh
  if [ ! -e ttmine-$pkgver ]; then
    return 1
  fi
  mkdir -p "$pkgdir/usr/bin/"
  cp ttmine-$pkgver ttmine "$pkgdir/usr/bin/"
}
