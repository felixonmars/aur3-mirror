# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=plasma-commandwatch-plasmoid
pkgver=0.1.1
pkgrel=4
pkgdesc="Plasmoid which periodically runs a system command and displays its output"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=84523"
license=('GPL2')
depends=('kdebase-workspace>=4.1.0')
makedepends=('gcc' 'cmake' 'automoc4')
install=commandwatch.install
source=("http://www.kde-look.org/CONTENT/content-files/84523-commandwatch-0.1.1.tar.bz2")
md5sums=('e9278c96870203b5fcf17a7660bb74da')

build() {
  cd "$srcdir/commandwatch-$pkgver"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/commandwatch-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
# vim:syntax=sh
