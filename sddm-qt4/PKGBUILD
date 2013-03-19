pkgname=sddm-qt4
pkgver=0.1.0
pkgrel=1
pkgdesc="QML based X11 display manager"
arch=('i686' 'x86_64')
backup=('etc/sddm.conf')
url="http://github.com/sddm/sddm"
license=('GPL')
depends=('qt4')
makedepends=('cmake')
provides=('sddm')

source=(https://github.com/sddm/sddm/archive/0.1.0.tar.gz)
md5sums=(5da271716883811819411ece2e41b88a)

build() {
  cd $srcdir/sddm-0.1.0 && 
  mkdir -p build && 
  cd build &&
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 &&
  make
}

package() {
  cd $srcdir/sddm-0.1.0/build &&
  make DESTDIR="$pkgdir" install
}

