pkgname=ahmed
pkgver=1.0
pkgrel=2
license=('custom')
arch=('i686' 'x86_64')
pkgdesc='Another software library on Hierarchical Matrices for Elliptic Differential equations'
url='http://bebendorf.ins.uni-bonn.de/AHMED.html'
depends=('metis')
makedepends=('gcc' 'metis' 'cmake' 'git')

build() {
  rm -rf $pkgname-$pkgver
  git clone https://github.com/xantares/ahmed.git $pkgname-$pkgver
  cd $pkgname-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make install DESTDIR="$pkgdir"
}

