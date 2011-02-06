# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=plasma-klicker-plasmoid
pkgver=0.1.1
pkgrel=4
pkgdesc="An icon application launcher with zooming."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=99554"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
install=klicker.install
source=("http://www.kde-look.org/CONTENT/content-files/99554-klicker$pkgver.tar.gz")
md5sums=('dc85a5d583c3576dfac57825d7cee567')

build() {
  cd "$srcdir"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir/" install
}
# vim:syntax=sh
