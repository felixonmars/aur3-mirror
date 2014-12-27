# Maintainer: Kiarash Korki <kiarash.96@gmail.com>
# Contributor: MohammadRRR <razeghi71@gmail.com>

pkgname=simspark
pkgver=0.2.4
pkgrel=1
pkgdesc="Spark physical simulation system"
arch=('i686' 'x86_64')
url="http://simspark.sourceforge.net"
license=('GPL2')
depends=('boost-libs' 'ruby' 'devil' 'ode' 'sdl' 'glu')
makedepends=('cmake' 'boost' 'freetype2' 'mesa')
source=(http://sourceforge.net/projects/simspark/files/simspark/0.2.4/$pkgname-$pkgver.tar.gz/download)
md5sums=('8679a043ee719e0cc75c72bbe15059d2')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname-$pkgver"
  cd build
  make DESTDIR="$pkgdir/" install
}
