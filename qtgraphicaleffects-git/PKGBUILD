# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtgraphicaleffects-git
pkgver=v5.1.0.6.g1e2b1fe
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtGraphicalEffects)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qtdeclarative-git')
makedepends=('git')
options=('!libtool')
source=(git://gitorious.org/qt/qtgraphicaleffects.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd qtgraphicaleffects
  git describe --always | sed 's|-|.|g'
}

build() {
  export LD_LIBRARY_PATH=/opt/qt-git/lib

  cd qtgraphicaleffects
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qtgraphicaleffects
  make INSTALL_ROOT="${pkgdir}" install
}
