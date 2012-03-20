# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=kitchensync
pkgver=0.40.1
pkgrel=2
pkgdesc="KDE synchronization application based on OpenSync"
arch=('i686' 'x86_64')
url="http://www.opensync.org/wiki/kitchensync"
license=('GPL')
depends=('kdebase-runtime' 'kdepimlibs' 'libopensync-svn')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/132538-$pkgname-$pkgver.tar.gz")
md5sums=('fd29bb97d0a18d82792947bdb94ca3a1')
install=$pkgname.install

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
