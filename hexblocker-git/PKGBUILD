# Contributor: hiaselhans <simon@booya.at>
# Contributor: pfm <vorticity@mail.ru>


pkgname="hexblocker-git"
pkgver=r130.d27b000
pkgrel=2
pkgdesc="Helper Program for OpenFoams BlockMesh."
arch=('i686' 'x86_64')
url="https://github.com/nicolasedh/hexBlocker"
license=('GPL')
depends=('vtk5')
makedepends=('git' 'qt4-private-headers' 'cmake' 'libxt')
source=("$pkgname::git+https://github.com/nicolasedh/hexBlocker")
md5sums=('SKIP')

pkgver() {
cd "$pkgname"
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
mkdir -p build
}

build() {
cd build
cmake "../$pkgname/src"
make
}

package() {
cd build
install -Dm755 HexBlocker "$pkgdir/usr/bin/hexblocker"
}


