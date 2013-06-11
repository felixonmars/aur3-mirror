# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qtquick1-git
pkgver=v5.1.0.beta1.4.ged11da0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtDeclarative)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qtscript-git' 'mesa')
makedepends=('git' 'gdb')
options=('!libtool' 'debug')
source=(git://gitorious.org/qt/qtquick1.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd qtquick1
  git describe --always | sed 's|-|.|g'
}

build() {
  export LD_LIBRARY_PATH=/opt/qt-git/lib

  cd qtquick1
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qtquick1
  make INSTALL_ROOT="${pkgdir}" install
}
