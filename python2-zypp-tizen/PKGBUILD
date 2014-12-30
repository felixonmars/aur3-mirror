## Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=python2-zypp-tizen
pkgver=0.5.14
pkgrel=1
pkgdesc="Python bindings for libzypp, the library for package management."
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp-bindings"
license=('GPL')
depends=('libzypp-git')
makedepends=('git' 'cmake' 'boost' 'swig2')
provides=('libzypp-bindings')
conflicts=('libzypp-bindings')
source=('http://download.tizen.org/tools/archive/14.03.1/openSUSE_13.1/src/libzypp-bindings-0.5.14-7.1.src.rpm')
md5sums=('0dfce182a659964f748d899a6e4e172a')
_gitname="libzypp-bindings"

prepare() {
  cd "$srcdir"
  tar -x -f $_gitname-$pkgver.tar.gz
  cd "$srcdir/$_gitname-$pkgver"

  for patch_file in $(find ../ -maxdepth 1 -name '*.patch' |sort)
  do
    patch -p1 -i $patch_file
  done
  sed -i '15 a\SET(CMAKE_MODULE_PATH /usr/lib/cmake/Zypp/${CMAKE_MODULE_PATH})' CMakeLists.txt
}

build() {
  cd "$srcdir/$_gitname-$pkgver"
  mv swig/legacy swig/zypp
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D SWIG_EXECUTABLE=/usr/bin/swig-2 \
    -D PYTHON_EXECUTABLE=/usr/bin/python2 \
    -D LIB=/lib \
    -D ZYPP_PREFIX=/usr \
    -D CMAKE_VERBOSE_MAKEFILE=TRUE \
    .
  make
}

package() {
  cd "$srcdir/$_gitname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
