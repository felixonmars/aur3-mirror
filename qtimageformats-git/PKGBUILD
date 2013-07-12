# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtimageformats-git
pkgver=v5.1.0.9.g2041263
pkgrel=1
pkgdesc="A cross-platform application and UI framework (Images plugins)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('libtiff' 'libmng' 'qtbase-git')
makedepends=('git')
options=('!libtool' 'debug')
source=(git://gitorious.org/qt/qtimageformats.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd qtimageformats
  git describe --always | sed 's|-|.|g'
}

build() {
  export LD_LIBRARY_PATH=/opt/qt-git/lib

  cd qtimageformats
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qtimageformats
  make INSTALL_ROOT="${pkgdir}" install
}
