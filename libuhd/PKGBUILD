# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=libuhd
pkgver=3.5.4
_verstring=003_005_004
pkgrel=1
pkgdesc="Universal Software Radio Peripheral userspace driver"
arch=('x86_64' 'i686')
url="http://code.ettus.com/redmine/ettus/projects/uhd/wiki"
license=('GPL')
groups=()
provides=()
depends=('python2-cheetah' 'boost-libs')
makedepends=('cmake' 'boost' 'python2-cheetah')
install='libuhd.install'

source=("libuhd-$pkgver.tar.gz::https://codeload.github.com/EttusResearch/uhd/tar.gz/release_$_verstring")
md5sums=('e90c95483a52b75cacc85f4fb0ef63ed')

build() {
  cd $srcdir/uhd-release_$_verstring/host
  # fix for py2k
  find -name "*.py" | xargs sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr/ -DPYTHON_EXECUTABLE=/usr/bin/python2
  make $MAKEFLAGS
}

check() {
  cd $srcdir/uhd-release_$_verstring/host/build
  make test
}

package() {
  cd $srcdir/uhd-release_$_verstring/host/build
  make DESTDIR=$pkgdir install
} 
