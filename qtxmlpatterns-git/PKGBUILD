# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qtxmlpatterns-git
pkgver=v5.1.0.beta1.5.gb3aa3fe
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtXmlPatterns)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qtbase-git')
makedepends=('git')
options=('!libtool')
source=(git://gitorious.org/qt/qtxmlpatterns.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd qtxmlpatterns
  git describe --always | sed 's|-|.|g'
}

build() {
  cd qtxmlpatterns
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qtxmlpatterns
  make INSTALL_ROOT="${pkgdir}" install
}
