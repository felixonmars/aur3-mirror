# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-qt5-tools-git
pkgver=v5.1.0.beta1.32.gfede665
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtTools)"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('kf5-qt5-base-git')
makedepends=('git')
provides=('kf5-qt5-tools')
options=('!libtool')
source=(git://gitorious.org/qt/qttools.git)
md5sums=('SKIP')

pkgver() {
  cd qttools
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd qttools
  git checkout dev
}

build() {
  export QT_SELECT=kf5

  cd qttools
  qtchooser -run-tool=qmake
  make
}

package() {
  cd qttools
  make INSTALL_ROOT="${pkgdir}" install
}
