# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kubeplayer
pkgver=1.2
pkgrel=1
pkgdesc="A multimedia player for different online platforms"
arch=('any')
url='https://projects.kde.org/projects/playground/multimedia/kubeplayer'
license=('GPL')
depends=('kdebindings-korundum')
makedepends=('cmake' 'automoc4')
source=("kubeplayer.tar.gz::http://quickgit.kde.org/index.php?p=kubeplayer.git&a=snapshot&h=8232e5402c175628a721ad86d3d236bbb200c830")
md5sums=('f3c996c9db0216e0de1cb41cba1018e0')
install=$pkgname.install

build() {
  cd $srcdir/$pkgname
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/$pkgname/build
  make DESTDIR=$pkgdir install
}
