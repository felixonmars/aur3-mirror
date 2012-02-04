# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=plasma-lastmoid
pkgver=0.6.5
pkgrel=3
pkgdesc="Shows your Last.fm charts on your desktop."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=98117"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
install=lastmoid.install
source=("http://kde-look.org/CONTENT/content-files/98117-vavrusa-lastmoid-2041bf6.tar.gz")
md5sums=('68674e24774f4d029f29e96795b5e8a0')

build() {
  cd "$srcdir/vavrusa-lastmoid-2041bf6"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/vavrusa-lastmoid-2041bf6/build"

  make DESTDIR="$pkgdir/" install
}
# vim:syntax=sh
