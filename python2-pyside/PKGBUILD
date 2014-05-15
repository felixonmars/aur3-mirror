# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pyside
_pkgrealname=pyside
pkgver=1.2.2
pkgrel=1
pkgdesc="Provides LGPL Qt bindings for Python and related tools for binding generation."
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.pyside.org"
_qtver=4.8
depends=("qt4>=${_qtver}" 'phonon' 'qtwebkit' "shiboken>=${pkgver}")
makedepends=('cmake' "shiboken>=$pkgver")
source=("http://download.qt-project.org/official_releases/pyside/pyside-qt${_qtver}+${pkgver}.tar.bz2"
        "CMakeLists.patch")
md5sums=('1969c2ff90eefaa4b200d234059d2287'
         'f07ba9bebf9bd038cb1033c4624c92a2')

build(){
  cd "$srcdir"

  patch ${_pkgrealname}-qt${_qtver}+$pkgver/CMakeLists.txt < CMakeLists.patch

  cd ${_pkgrealname}-qt${_qtver}+$pkgver

  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DBUILD_TESTS=OFF \
           -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
           -DQT_PHONON_INCLUDE_DIR=/usr/include/qt4/phonon
  make
}

package(){
    cd $srcdir/${_pkgrealname}-qt${_qtver}+$pkgver/build
    make DESTDIR=$pkgdir install
}
