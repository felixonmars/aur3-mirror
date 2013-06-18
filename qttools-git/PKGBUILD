# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qttools-git
pkgver=v5.1.0.beta1.32.gfede665
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtTools)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qtbase-git')
makedepends=('git' 'gdb')
options=('!libtool' 'debug')
source=(git://gitorious.org/qt/qttools.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd qttools
  git describe --always | sed 's|-|.|g'
}

build() {
  export LD_LIBRARY_PATH=/opt/qt-git/lib

  cd qttools
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qttools
  make INSTALL_ROOT="${pkgdir}" install
}
