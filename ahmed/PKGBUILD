pkgname=ahmed
pkgver=1.0
pkgrel=1
license=('custom')
arch=('i686' 'x86_64')
pkgdesc='Another software library on Hierarchical Matrices for Elliptic Differential equations'
url='http://bebendorf.ins.uni-bonn.de/AHMED.html'
depends=('metis')
makedepends=('gcc' 'metis' 'cmake' 'git')

build() {
  git clone https://github.com/xantares/AHMED.git $pkgname-$pkgver
  cd $pkgname-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make install DESTDIR=$pkgdir
}

