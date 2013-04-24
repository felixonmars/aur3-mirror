pkgname=nepomuk-core-git
_gitname=nepomuk-core
pkgver=v4.10.2.139.g3c73a53
pkgrel=1
pkgdesc='Contains the central Nepomuk services like file indexing, file system monitoring, query, storage, client libraries'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('kdelibs4-git' 'poppler-qt' 'taglib' 'ffmpeg')
makedepends=('git' 'cmake' 'automoc4' 'doxygen')
conflicts=('nepomuk-core')
provides=('nepomuk-core')
groups=('kde-git')
source=('git://anongit.kde.org/nepomuk-core')
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
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
    "${pkgdir}"/usr/bin/nepomuk-simpleresource-rcgen
}
