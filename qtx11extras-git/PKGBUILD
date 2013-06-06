# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qtx11extras-git
pkgver=v5.1.0.beta1.3.g30fd950
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtX11Extras)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qtbase-git')
makedepends=('git')
options=('!libtool')
source=(git://gitorious.org/qt/qtx11extras.git#branch=dev)
md5sums=('SKIP')

pkgver() {
  cd qtx11extras
  git describe --always | sed 's|-|.|g'
}

build() {
  cd qtx11extras
  /opt/qt-git/bin/qmake
  make
}

package() {
  cd qtx11extras
  make INSTALL_ROOT="${pkgdir}" install
}
