# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-qt5-jsbackend-git
pkgver=v5.1.0.beta1.4.g6f2625e
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtV8)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('kf5-qt5-base-git')
makedepends=('git')
provides=('kf5-qt5-declarative')
options=('!libtool')
source=(git://gitorious.org/qt/qtjsbackend.git)
md5sums=('SKIP')

pkgver() {
  cd qtjsbackend
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd qtjsbackend
  git checkout dev
}

build() {
  export QT_SELECT=kf5

  cd qtjsbackend
  qtchooser -run-tool=qmake
  make
}

package() {
  cd qtjsbackend
  make INSTALL_ROOT="${pkgdir}" install
}
