# Maintainer: Artem Grunichev <gluk@umbrosia.ru>

pkgname=xfstk
pkgver=1.7.3
pkgrel=1
pkgdesc="Updater for Intel SoC firmware over USB using the DNX protocol"
arch=('i686' 'x86_64')
url="http://xfstk.sourceforge.net"
license=('LGPL')
groups=('devel')
makedepends=()
source=(http://sourceforge.net/projects/xfstk/files/xfstk-dldr-linux-source-$pkgver.tar.gz/download)
sha1sums=('aac912e989ac448057353799428c7ad7a9174c80')

build() {
  cd "$srcdir"/$pkgname-build/linux-source-package
  mkdir build
  cd build
  export DISTRIBUTION_NAME=ubuntu12.04
  export BUILD_VERSION=0.0.0
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir" ..
  make
}

package() {
  cd "$srcdir"/$pkgname-build/linux-source-package/build
  make DESTDIR="$pkgdir" prefix="$pkgdir" install
}
