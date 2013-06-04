# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-qt5-x11extras-git
pkgver=v5.1.0.beta1.3.g30fd950
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtX11Extras)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('kf5-qt5-base-git')
makedepends=('git')
provides=('kf5-qt5-x11extras')
options=('!libtool')
source=(git://gitorious.org/qt/qtx11extras.git)
md5sums=('SKIP')

pkgver() {
  cd qtx11extras
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd qtx11extras
  git checkout dev
}

build() {
  export QT_SELECT=kf5

  cd qtx11extras
  qtchooser -run-tool=qmake
  make
}

package() {
  cd qtx11extras
  make INSTALL_ROOT="${pkgdir}" install
}
