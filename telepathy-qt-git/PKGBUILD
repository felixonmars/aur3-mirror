# Maintainer: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=telepathy-qt-git
_gitname="telepathy-qt"
pkgver=0.9.3.13.g7553d37
pkgrel=1
epoch=1
pkgdesc="A library for Qt-based Telepathy clients"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org"
license=('LGPL')
depends=('qt4' 'telepathy-farstream')
makedepends=('libxslt' 'python2' 'cmake' 'git' 'doxygen')
conflicts=('telepathy-qt' 'telepathy-qt4-git')
provides=('telepathy-qt' 'telepathy-qt4-git')
options=('!libtool')
source=("git://git.collabora.co.uk/git/freedesktop.org-mirror/telepathy/telepathy-qt.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g;s|telepathy.qt.||'
}

build() {
  msg "Starting configure..."

  rm -rf ${srcdir}/build && mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ../$_gitname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DDISABLE_WERROR=True \
      -DPYTHON_EXECUTABLE=/usr/bin/python2 \
      -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
      -DCMAKE_POSITION_INDEPENDENT_CODE=on \
      -DENABLE_TESTS=false
#       -DQT_MOC_EXECUTABLE=/usr/bin/moc-qt4 \
#       -DQT_RCC_EXECUTABLE=/usr/bin/rcc-qt4 \
#       -DQT_UIC_EXECUTABLE=/usr/bin/uic-qt4 \
  
  msg "Starting make..."
  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR="$pkgdir" install
}
