# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-qtmobility-git
_pkgname=pyside-mobility
pkgver=20120831
_pyver=2.7
pkgrel=1
pkgdesc="PySide bindings for QtMobility"
arch=('i686' 'x86_64')
url="http://www.pyside.org/docs/pyside-mobility/"
license=('GPL')
depends=("python2>=$_pyver" 'python2-pyside-git' 'qtmobility')
makedepends=('cmake>=2.6.0' 'libxml2' 'libxslt' 'shiboken-git' 'git')

_gitroot="git://github.com/PySide/Mobility.git"
_gitname="Mobility"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi

  # disable Messaging (required files are not in QtMobility C++)
  sed -i "/add_if_found(Messaging)/d" QtMobility/CMakeLists.txt

  rm -rf build
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DGENERATOR=/usr/bin/shiboken \
      -DENABLE_ICECC=0 \
      -DPYTHON_LIBRARY=/usr/lib/libpython$_pyver.so \
      -DPYTHON_EXECUTABLE=/usr/bin/python2 \
      -DPYTHON_INCLUDE_DIR=/usr/include/python$_pyver \
      -DBUILD_TESTS=OFF \
      -DENABLE_GCC_OPTIMIZATION=On

  VERBOSE=1 make
}

package() {
    cd "$srcdir/$_gitname/build"
    make DESTDIR="$pkgdir" install
}

