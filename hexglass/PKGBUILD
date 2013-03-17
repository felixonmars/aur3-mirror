# Maintainer: Alexey Michurin <a.michurin@gmail.com>

pkgname=hexglass
pkgver=1.2.1
pkgrel=3
pkgdesc='A Tetris-like game on a hexagonal grid'
arch=('i686' 'x86_64')
url='http://hexglass.googlecode.com/'
license=('GPL3')
groups=()
depends=('qt4')
makedepends=('qt4')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog="$pkgname.changelog"
source=("http://hexglass.googlecode.com/files/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('408148e6b05065d12edd7066b929465b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
