# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qtdeclarative-git
pkgver=v5.1.0.beta1.89.g7e73dc0
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtQml, QtQuick)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qtxmlpatterns-git' 'mesa')
makedepends=('git' 'gdb')
conflicts=('qtjsbackend-git')
replaces=('qtjsbackend-git')
options=('!libtool' 'debug')
source=(git://gitorious.org/qt/qtdeclarative.git#branch=dev
        'use-python2.patch')
md5sums=('SKIP'
         'd2897bedd03bc05f8aa110abc0b06840')

pkgver() {
  cd qtdeclarative
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd qtdeclarative
  patch -p1 -i "${srcdir}"/use-python2.patch
}

build() {
  export LD_LIBRARY_PATH=/opt/qt-git/lib

  cd qtdeclarative
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qtdeclarative
  make INSTALL_ROOT="${pkgdir}" install
}
