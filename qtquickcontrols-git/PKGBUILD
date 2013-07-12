# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtquickcontrols-git
pkgver=v5.1.0.61.g593f2d4
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtQuick)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qtdeclarative-git')
makedepends=('git')
options=('!libtool' 'debug')
source=(git://gitorious.org/qt/qtquickcontrols.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd qtquickcontrols
  git describe --always | sed 's|-|.|g'
}

build() {
  export LD_LIBRARY_PATH=/opt/qt-git/lib

  cd qtquickcontrols
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qtquickcontrols
  make INSTALL_ROOT="${pkgdir}" install
}
