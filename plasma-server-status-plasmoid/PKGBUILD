# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=plasma-server-status-plasmoid
pkgver=1.2
pkgrel=3
pkgdesc="Lets you monitor one or more servers via pings in a configurable interval."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=101336"
license=('GPL')
depends=('kdebase-workspace>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
install=server-status.install
source=("http://www.kde-look.org/CONTENT/content-files/101336-serverstatus-${pkgver}.tar.bz2")
md5sums=('7638b43ced070ee433b5b256c9684dae')

build() {
  cd "$srcdir/serverstatus-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/serverstatus-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
# vim:syntax=sh
