# Maintainer: Kiarash Korki <kiarash.96@gmail.com>

pkgname=rcssserver3d
pkgver=0.6.8.1
pkgrel=1
pkgdesc="Robocup 3D Soccer Simulation Server"
arch=('i686' 'x86_64')
url="http://simspark.sourceforge.net"
license=('GPL2')
depends=('simspark' 'boost-libs' 'ruby' 'devil' 'ode' 'sdl' 'glu')
makedepends=('cmake' 'boost')
source=(http://sourceforge.net/projects/simspark/files/rcssserver3d/0.6.8/$pkgname-$pkgver.tar.gz/download)
md5sums=('c97352a5ce3f63ec13efdecc4037100c')

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
