pkgname=soprano-git
_gitname=soprano
pkgver=v2.9.0.5.gd6a6fe6
pkgrel=1
pkgdesc="A library which provides a highly usable object-oriented C++/Qt4 framework for RDF data"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('qt4' 'redland-storage-virtuoso' 'libiodbc' 'virtuoso-base')
makedepends=('cmake' 'doxygen' 'git')
conflicts=('soprano')
provides=('soprano')
groups=('kde-git')
source=('git://anongit.kde.org/soprano')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir
  
  msg "GIT checkout done"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build
  fi
  mkdir $srcdir/build
  cd $srcdir/build
  cmake $srcdir/$_gitname -DCMAKE_BUILD_TYPE=debugfull \
		-DCMAKE_SKIP_RPATH=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSOPRANO_DISABLE_CLUCENE_INDEX=ON \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
