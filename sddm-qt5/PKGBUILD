pkgname=sddm-qt5
pkgver=0.8.99
pkgrel=2
pkgdesc="QML based X11 display manager"
arch=('i686' 'x86_64')
url="http://github.com/sddm/sddm"
license=('GPL')
depends=('qt5-declarative')
makedepends=('cmake' 'python-docutils' 'qt5-tools')
provides=('sddm')
install='sddm.install'

source=(https://github.com/sddm/sddm/archive/v$pkgver.tar.gz)
md5sums=('946d4bcfb82aebe02f30c3bf27cc9653')

build() {
  cd $srcdir/sddm-$pkgver
  mkdir -p build
  cd build
  cmake ../$_pkgbase \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_MAN_PAGES=ON \
		-DUSE_QT5=true
  make
}

package() {
  cd $srcdir/sddm-$pkgver/build &&
  make DESTDIR="$pkgdir" install
}

